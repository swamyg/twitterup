class Provider < ActiveRecord::Base

  has_many :streams

  def fetch_content

  end
end