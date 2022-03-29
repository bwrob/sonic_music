counter=0

live_loop :guit do
  rates = [0.25,0.5].ring
  with_fx :echo, mix: 0.3, phase: 0.25 do
    sample :guit_em9, rate: rates[counter]
  end
  sample :guit_em9, rate: (-1)*rates[counter]
  sleep 8
  counter = (inc counter)
end


live_loop :beat do
  with_fx :reverb, room: 1 do
    sample :bd_boom, rate: 2.5
  end
  sleep 0.5
  with_fx :echo, mix: 0.3, phase: 0.25 do
    sample :bd_haus, rate: 1.5
  end
  sleep 1.5
end