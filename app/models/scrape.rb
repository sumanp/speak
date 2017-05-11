class Scrape < ApplicationRecord
  validates_presence_of :url
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
