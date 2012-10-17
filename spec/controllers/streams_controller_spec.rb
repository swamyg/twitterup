require 'spec_helper'

describe StreamsController do
  render_views

  describe "#index" do

    context "when someone visits a particular stream on index page" do

      it "fetches new content" do
        controller.should_receive(:fetch_new_content)
        get :index, :provider => 'twitter'
      end

      context "when the stream contains data" do
        before do
          @single_stream = FactoryGirl.create(:twitter_stream)
        end

        it "gets the stream of that provider" do
          assigns(:stream).should == [@single_stream]
          get :index, :provider => 'twitter'
        end

        it "renders the appropriate stream template" do
          get :index, :provider => 'twitter'
          response.should render_template(:partial => "streams/templates/_twitter")
        end
      end
    end
  end
end