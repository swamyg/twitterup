require 'spec_helper'

describe StreamsController do
  render_views

  describe "#index" do
    context "when someone visits a particular stream on index page" do
      before do
        @provider = FactoryGirl.create(:twitter)
      end

      it "renders the appropriate provider template" do
        get :index, :provider_name => @provider.name
        response.should render_template(:partial => "streams/templates/_twitter")
      end
    end
  end

  describe "#fetch_new_content" do
    context "given a valid provider name" do
      before do
        @provider = FactoryGirl.create(:twitter)
      end

      it "finds the provider by it's name" do
        controller.fetch_new_content(@provider.name)
        assigns(:provider).should == @provider
      end

      it "invokes fetch_content on provider" do
        Provider.any_instance.expects(:fetch_content)
        controller.fetch_new_content(@provider.name)
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