def pause_vcr(cassette_name=nil, erb=false)
  VCR.insert_cassette(cassette_name, :erb => erb, record: :new_episodes)
end

def play_vcr
  VCR.eject_cassette
end
