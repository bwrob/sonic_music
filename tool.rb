i=0
j=0

guit_rates = [0.25,0.5].ring
piano_second_note = [60,50,65,60,60].ring

pan=0
pan_inc=0.3

live_loop :guit do
  
  with_fx :echo, mix: 0.3, phase: 0.25 do
    sample :guit_em9, rate: guit_rates[i]
  end
  
  sample :guit_em9, rate: (-1)*guit_rates[i]
  sleep 8
  i = (inc i)
  
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


live_loop :piano do
  
  play 45, amp: 1, pan: pan
  play piano_second_note[j], amp: 0.5, pan: pan
  sleep 1
  
  pan = pan+pan_inc
  if pan>=1
    pan = 2-pan
    pan_inc = pan_inc*(-1)
  end
  if pan <=-1
    pan = -2-pan
    pan_inc = pan_inc*(-1)
  end
  
  j = (inc j)
  
end
