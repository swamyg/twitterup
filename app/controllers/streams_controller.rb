class StreamsController < ApplicationController

  def index
    provider_name = params[:provider_name].blank? ? 'twitter' : params[:provider_name]
    query = params[:q].blank? ? "Thredup" : params[:q]
    fetch_new_content(provider_name, query)
  end

  def fetch_new_content(provider_name, query)
    @provider = Provider.find_by_name(provider_name)
    render :error and return unless @provider
    @raw_stream = @provider.fetch_content(query)
  end

end