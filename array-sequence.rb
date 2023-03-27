##| 配列でシーケンス作ったりの習作

use_bpm 98

##| 配列でバスドラとスネアのシーケンスを作る
a = [1,0,1,0,2,0,0,0,1,0,0,0,2,1,0,0]
live_loop :drum1 do
  16.times do |i|
    sample :bd_haus if a[i] == 1
    sample :sn_zome if a[i] == 2
    sleep 0.25
    
  end
end

##| 配列でオープン/クローズハットのシーケンスを作る
b = [1,1,1,2,1,0,1,0,1,0,1,1,2,1,0,1]
live_loop :drum2 do
  16.times do |i|
    sample :drum_cymbal_closed, finish: 0.2 if b[i] == 1
    sample :drum_cymbal_open, amp: 0.5, finish: 0.3 if b[i] == 2
    sleep 0.25
    
  end
end

##| アシッドベースライン
live_loop :base do
  use_synth :tb303
  16.times do
    play scale(:e2, :minor).choose, cutoff: rrand(40, 80), release: 0.2, amp: 0.3 if spread(16, 16).tick
    sleep 0.25
  end
end

##| メロディー
##| live_loop :melody do
##|   use_synth :tb303
##|   use_synth :chiplead
##|   32.times do
##|     use_random_seed 144
##|     play scale(:e5, :minor , num_octave: 2).choose, cutoff: rrand(40, 80), release: 0.3, amp: 0.2 if spread(3,16).tick
##|     sleep 0.25
##|   end
##|   32.times do
##|     use_random_seed 19
##|     play scale(:e5, :minor , num_octave: 2).choose, cutoff: rrand(40, 80),  release: 0.2, amp: 0.3 if spread(6,16).tick
##|     sleep 0.25
##|   end
##| end


##| コード進行
progression = (ring, :i, :vi, :ii, :v)
live_loop :chord do
  use_synth :fm
  play chord_degree(progression.tick, :e3, :minor, 3), amp: 1.5, release: 0.25 if spread(5, 16).tick
  sleep 0.25
end
