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
  doc = Nokogiri::HTML(open(url).read)
  name = doc.search('h1').text
  birthday = doc.search("//span[@itemprop = 'birthDate']").text.match(/(?<date>(\d{2}.){2}\d{4})/)
  nation = doc.search("//span[@itemprop = 'nationality']").text
  value = doc.search('.dataMarktwert a').text.match(/(?<money>(\d{3}|\d{2}),\d{2}\s\w{3}.\s€)/)
    {
      name: name,
      birthday: birthday['date'],
      nation: nation,
      value: value['money']
    }
end
