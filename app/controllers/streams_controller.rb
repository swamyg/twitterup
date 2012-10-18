class StreamsController < ApplicationController

  def index
    provider_name = params[:provider_name].blank? ? 'twitter' : params[:provider_name]
    fetch_new_content(provider_name)
  end

  def fetch_new_content(provider_name)
    @provider = Provider.find_by_name(provider_name)
    render :error and return unless @provider
    @raw_stream = @provider.fetch_content
  end

end