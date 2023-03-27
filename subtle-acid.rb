##| 微妙なアシッドチックな習作

use_bpm 98

##| 四つ打ちのキック
live_loop :kick do
  sample :bd_haus, amp: 1 if spread(4, 16).tick
  sleep 0.25
end

##| 太めのベース
live_loop :bass do
  use_synth :fm
  16.times do
    play scale(:e1, :minor).choose, amp: 0.7 if spread(6, 10).tick
    sleep 0.25
  end
end

##| live_loop :pad do
##|   sample :ambi_choir, amp: 0.1, finish: 0.5, pan: 0.2 if spread(4, 32).rotate(-2).tick
##|   sleep 0.25
##| end

##| アシッドベース
live_loop :acid do
  use_synth :tb303
  use_random_seed 100
  16.times do
    play scale(:e2, :minor_pentatonic).choose, amp: 0.06, cutoff: rrand(70, 100), pan: -0.4 if spread(9, 16).tick
    sleep 0.25
  end
end

##| クローズハット
live_loop :closehat do
  sample :drum_cymbal_closed, start: 0.1, finish: 0.25, pan: 0.7, amp:0.5 if spread(20, 32).tick
  sleep 0.25
end

##| シンバル
live_loop :hat do
  sample :drum_cymbal_soft, finish: 0.25, pan: 0.7, amp: 0.4 if spread(4, 16).rotate(2).tick
  sleep 0.25
end

##| シンバルペダル
live_loop :pedalhat do
  sample :drum_cymbal_pedal, sustain: 0.8, pan: 0.7, amp: 0.4 if spread(9, 32).tick
  sleep 0.25
end
