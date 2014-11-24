require 'rails_helper'

describe SearchController do
  render_views

  describe "GET #index" do


    context "with valid query" do
      it "should redirect ro search index page with query results" do
        get(:index, {twitter_search: "Cat"})
        expect(response).to render_template "search/index"
        expect(response.status).to eq 200
      end

      it "should render the twitter partial" do
        get(:index, {twitter_search: "Cat"})
        expect(response).to render_template(:partial => '_twitter_results')
      end

      it "should render the vimeo partial" do
      end
    end

    context "with invalid query" do
      it "should render home index page with notice if an empty string is submitted as query" do
        get(:index, {twitter_search: ""})

        expect(response.status).to eq 200
      end
    end

  end

end
