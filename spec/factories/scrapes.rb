FactoryGirl.define do
  factory :scrape do
    url (Faker::Internet.url)
    h1 nil
    h2 nil
    h3 nil
  end
end
