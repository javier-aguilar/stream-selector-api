require 'kimurai'
require './app/poros/album.rb'

class BandcampService < Kimurai::Base
  def self.wishlist(username)
    response = scrape(username)
    @@list if response
  end

  def self.scrape(username)
    @name = 'bandcamp_spider'
    @engine = :mechanize
    @start_urls = ["https://bandcamp.com/#{username}/wishlist"]
    @config = {
      skip_request_errors: [{ error: RuntimeError, message: '404 => Net::HTTPNotFound' }]
    }
    @@list = []
    BandcampService.crawl!
  end

  def parse(response, url:, data: {})
    response.xpath("//div[@class='item-details-container']").each do |albums|
      title = albums.css("[@class='collection-item-title']//text()").text
      artist = albums.css("[@class='collection-item-artist']//text()").text[3..-1]
      @@list << Album.new(artist, title)
    end
  end
end
