class Crawler
  require 'nokogiri'
  require 'open-uri'

  class << self
    def crawl
      doc = Nokogiri::HTML(open('http://news.ycombinator.com/newest'))

      # This finds the base url only (like "(google.com)")
      links = []
      doc.css(".comhead").each do |link|
        links << (link.content).gsub(/\(|\)/, "")
      end
      links.each do |l|
        puts "informing users with link: #{l.strip}"
        User.inform_all_with_link(l.strip)
      end

      # # This finds the full url. Gets rid of the protocol.
      # links = []
      # doc.css("td.title a").each do |link|
      #   links << (link["href"]).gsub(/(https:\/\/)|(http:\/\/)/, "")
      # end
      # links.each do |l|
      #   User.inform_all_with_link(l)
      # end

    end

  end

end