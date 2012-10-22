require 'spec_helper'

describe StreamsController do
  render_views

  describe "#index" do
    context "given a provider" do
      before do
        @provider = FactoryGirl.create(:twitter)
        url = @provider.url.gsub("QUERY", "Thredup")
        FakeWeb.register_uri(:get, url, :body => "<html><body>Thredup is cool yo!</html></body>")
      end

      context "when someone visits a particular stream on index page" do
        it "renders the appropriate provider template" do
          get :index, :provider_name => @provider.name
          response.should render_template(:partial => "streams/templates/_twitter")
        end
      end

      context "when the page is updated through ajax" do
        it "renders the content inline" do
          get :index, :provider_name => @provider.name, :update => "true"
          response.body.should == "<html><body>Thredup is cool yo!</html></body>"
        end
      end
    end
  end

  describe "#fetch_new_content" do
    context "given a valid provider name" do
      before do
        @provider = FactoryGirl.create(:twitter)
      end

      it "finds the provider by it's name" do
        controller.fetch_new_content(@provider.name, "thredup")
        Provider.any_instance.stubs(:fetch_content)
        assigns(:provider).should == @provider
      end

      it "invokes fetch_content on provider" do
        Provider.any_instance.expects(:fetch_content)
        controller.fetch_new_content(@provider.name, "thredup")
      end
    end

    context "given an invalid provider name" do
      it "renders an error" do
        get :index, :provider_name => 'something_bogus'
        response.should render_template(:error)
      end
    end
  end
end