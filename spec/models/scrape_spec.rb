require 'rails_helper'

RSpec.describe Scrape, type: :model do
  it { should validate_presence_of(:url) }
end
