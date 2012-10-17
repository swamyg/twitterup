class StreamsController < ApplicationController

  def index
    @provider = params[:provider].blank? ? 'twitter' : params[:provider]
    fetch_new_content
  end

  def fetch_new_content
    @stream = Provider.find_by_name(@provider).try(:streams)
  end

end