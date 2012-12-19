def pause_vcr(cassette_name=nil, erb=false)
  Timecop.freeze(Time.local(2022, 1, 1, 10, 0, 0))
  VCR.insert_cassette(cassette_name, :erb => erb, record: :new_episodes)
end

def play_vcr
  VCR.eject_cassette
  Timecop.return
end
