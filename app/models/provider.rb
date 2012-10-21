require 'httparty'
class Provider < ActiveRecord::Base

  include HTTParty
  has_many :streams

  def fetch_content(query)
    url = self.url.gsub("QUERY", query)
    HTTParty.get(url)
  end
end