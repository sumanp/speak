class ScrapesController < ApplicationController
  require 'open-uri'

  def index
    @scrapes = Scrape.all
    json_response(@scrapes)
  end

  def create
    @scrape = Scrape.create!(scrape_params)

    url = params[:url]
    doc = Nokogiri::HTML(open(url))
    doc.css('h1').map{ |h1| @scrape.h1 << h1.content }
    doc.css('h2').map{ |h2| @scrape.h2 << h2.content }
    doc.css('h3').map{ |h3| @scrape.h3 << h3.content }
    doc.css('a').map { |link| @scrape.links << link['href'] }

    @scrape.save
    json_response(@scrape, :created)
  end

  private
  def scrape_params
    params.permit(:url)
  end
end
