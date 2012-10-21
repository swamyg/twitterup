require 'spec_helper'

describe Provider do

  describe "#fetch_content" do
    context "given a provider and contents on it url" do
      before do
        @provider = FactoryGirl.create(:twitter)
        url = @provider.url.gsub("QUERY", "Thredup")
        FakeWeb.register_uri(:get, url, :body => "Thredup is cool yo!")
      end

      it "fetches content from the provide url" do
        @stream = @provider.fetch_content("Thredup")
        @stream.should == "Thredup is cool yo!"
      end
    end
  end
end
