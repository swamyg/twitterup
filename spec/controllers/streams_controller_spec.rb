require 'spec_helper'

describe StreamsController do

  describe "#index" do

    context "when someone visits a particular stream on index page" do
      it "fetches new content" do
        StreamsController.expects(:fetch_new_content).once
        get :index, :provider => 'twitter'
      end

      context "when the stream contains data" do
        before do
          @stream = Factory :twitter
          get :index, :provider => 'twitter'
        end

        it "gets the stream of that provider" do
          Stream.expects(:find_by_provider).with do |provider|
            provider.should == 'twitter'
          end
        end

        it "renders the appropriate stream template" do
          controller.should_receive(:render).with(:partial => 'templates/twitter.html.haml')
        end
      end
    end
  end
end