# Coding Challenge: Website Scraper API in Rails 5

### API with:
  Two Endpoints
  1. Scrape & Index contents inside H1, H2, H3 & Anchor tags URL, when given a url as an input
  2. List the records of the scraped model


### How to run the application?
1. clone the repo
2. bundle install
3. rails db:setup
4. rails db:migrate
5. bundle exec rspec
6. rails s

### How to test api endpoints?
1. brew install httpie
2. http POST :3000/scrapes url=http://github.com
3. http GET :3000/scrapes
