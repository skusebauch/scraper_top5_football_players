require 'open-uri'
require 'nokogiri'

def fetch_players_urls
  url = 'https://www.transfermarkt.de/spieler-statistik/wertvollstespieler/marktwertetop'
  html_doc = Nokogiri::HTML(open(url).read)
  players = html_doc.search('.hauptlink a')
  top_five = []
  players.take(5).each do |player|
    top_five << "https://www.transfermarkt.de#{player.attributes['href'].value}"
  end
  top_five
end

def scrape_player(url)
end


