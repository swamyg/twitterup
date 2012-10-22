class StreamsController < ApplicationController

  def index
    set_provider_and_query
    fetch_new_content(@provider_name, @query)
    render :text => @raw_stream.html_safe, :content_type => 'text/plain' and return if params[:update]
  end

  def fetch_new_content(provider_name, query)
    @provider = Provider.find_by_name(provider_name)
    render :error and return unless @provider
    @raw_stream = @provider.fetch_content(query)
  end

  def set_provider_and_query
    @provider_name = params[:provider_name].blank? ? 'twitter' : params[:provider_name]
    @query = params[:q].blank? ? "Thredup" : params[:q]
  end

end