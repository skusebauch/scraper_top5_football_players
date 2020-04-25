require 'yaml'
require_relative 'scraper'

puts 'Fetching URLs'
urls = fetch_players_urls

players = urls.map do |url|
  puts "Scraping #{url}"
  scrape_player(url)
end

puts 'Writing players.yml'
File.open('players.yml', 'w') do |f|
  f.write(players.to_yaml)
end

puts "Done."
