require 'rails_helper'

describe Subscription do
  describe '.validates' do
    it 'local_id must be present' do
      expect(Subscription.create(user_id: 7, local_id: nil, media: "twitter").valid?).to eq false
    end

    it 'media must be present' do
      expect(Subscription.create(user_id: 7, media: nil, local_id: "307550006").valid?).to eq false
    end

    it 'user_id must be present' do
      expect(Subscription.create(user_id: nil, media: "twitter", local_id: "307550006").valid?).to eq false
    end

    it 'should be created if user_id, local_id, and media are all present' do
      expect(Subscription.create(user_id: 7, media: "twitter", local_id: "307550006").valid?).to eq true
    end

    it 'media value must be "twitter" or "vimeo"' do
      expect(Subscription.create(user_id: 7, media: "facebook", local_id: "30453453").valid?).to eq false
      expect(Subscription.create(user_id: 8, media: "vimeo", local_id: "3234234324").valid?).to eq true
    end
  end
end
