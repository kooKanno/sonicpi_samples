use_midi_defaults port: "iac_driver_spconnect"
##| ランダムビープの習作

use_bpm 98

live_loop :click do
  midi_clock_beat
  sleep 1
end

##| ランダムに生成されるハイビープ
live_loop :HighBeep do
  use_synth :beep
  play :e8, pitch: rrand(1, 15), sustain: rrand(0.1, 1), decay: 0, attack:0, release: 0, pan: rrand(-1, 1)
  sleep rrand(0.5, 6)
end

##| ランダムに生成されるハイビープ(midi)
##| live_loop :HighBeep, sync: :click do
##|   midi :e8, pitch: rrand(1, 15), sustain: rrand(0.1, 1), decay: 0, attack:0, release: 0, pan: rrand(-1, 1)
##|   sleep rrand(0.5, 6)
##| end

##| ランダムに生成されるロウビープ
live_loop :LowBeep do
  use_synth :beep
  play :e1, pitch: rrand(1, 15), sustain: rrand(0.1, 1), decay: 0, attack:0, release: 0, pan: rrand(-1, 1)
  sleep rrand(0.5, 10)
end

##| ランダムに生成されるロウビープ(midi)
##| live_loop :LowBeep, sync: :click do
##|   use_synth :beep
##|   midi :e1, pitch: rrand(1, 15), sustain: rrand(0.1, 1), decay: 0, attack:0, release: 0, pan: rrand(-1, 1)
##|   sleep rrand(0.5, 10)
##| end

##| リズム?エフェクト?
live_loop :Rythm do
  sample :drum_cowbell, finish: rrand(0.2, 1), pitch: rrand(1, 6)
  sleep rrand(0.2, 11)
end

##| リズム?エフェクト?(midi)
##| live_loop :Rythm, sync: :click do
##|   midi:c4, finish: rrand(0.2, 1), pitch: rrand(1, 6)
##|   sleep rrand(0.2, 11)
##| end

##| 四つ打ちのキック
live_loop :Kick do
  sample :bd_808, amp: 2 if spread(1, 4).tick
  sleep 0.25
end

##| 四つ打ちのキック(midi)
##| live_loop :Kick, sync: :click do
##|   midi :c1 if spread(8, 16).tick
##|   sleep 0.25
##| end

##| 変なパーカッション
live_loop :Tick do
  sample :elec_tick, finish: 0.5 if spread(11, 16).tick pan: 0.8
  sleep 0.25
end

##| 変なパーカッション(midi)
##| live_loop :Tick do
##|   midi :c1, finish: 0.5 if spread(11, 16).tick pan: 0.8
##|   sleep 0.25
##| end

##| 変なパーカッション2
live_loop :CHat do
  sample :elec_blup, pitch: 20, finish: 0.3 if spread(7, 24).tick pan: 0.8
  sleep 0.25
end

##| 変なパーカッション2(midi)
##| live_loop :CHat, sync: :click do
##|   midi :c1,finish: 0.3 if spread(7, 24).tick pan: 0.8
##|   sleep 0.25
##| end

##| 奇妙なベース
live_loop :Base do
  use_synth :sine
  play scale(:e2, :chinese).choose, attack: 0, release: 0, decay: 0, sustain: 0.1, amp: 0.4 if spread(6, 16).tick
  sleep 0.25
end

##| 奇妙なベース(midi)
##| live_loop :Base, sync: :click do
##|   midi scale(:e2, :chinese).choose, attack: 0, release: 0, decay: 0, sustain: 0.1, amp: 0.4 if spread(6, 16).tick
##|   sleep 0.25
##| end


##| use_random_seed 14
##| live_loop :Base, sync: :click do
##|   midi scale(:e5, :chinese).choose, attack: 0, release: 0, decay: 0, sustain: 0.1, amp: 0.4 if spread(6, 8).tick
##|   sleep 0.25
##| end
