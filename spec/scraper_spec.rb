require_relative '../scraper'

describe '#fetch_players_urls' do

  # Note: this test may break because players top order might change!
  it 'returns an array of players' do
    urls = fetch_players_urls
    expected = [
      'https://www.transfermarkt.de/kylian-mbappe/profil/spieler/342229',
      'https://www.transfermarkt.de/raheem-sterling/profil/spieler/134425',
      'https://www.transfermarkt.de/neymar/profil/spieler/68290',
      'https://www.transfermarkt.de/sadio-mane/profil/spieler/200512',
      'https://www.transfermarkt.de/mohamed-salah/profil/spieler/148455'
    ]
    expect(urls).to eq(expected)
  end
end

describe '#scrape_player' do
  it 'returns a Hash with proper information of player' do
    kylian_mbappe_url = 'https://www.transfermarkt.de/kylian-mbappe/profil/spieler/342229'
    player = scrape_player(kylian_mbappe_url)

    expected = {
      name: 'Kylian Mbappé',
      birthday: '20.12.1998',
      nation: 'Frankreich',
      value: '180,00'
    }
    expect(player).to eq(expected)
  end
end
