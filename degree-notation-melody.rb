##| 度数譜にメロディーをのせるゆるっとした習作

use_bpm 98

##| コード進行（度数）
progression = (ring, :i, :vi, :ii, :v)

##| 代入したコード進行でコードを生成。引数にキーを設定してる。
live_loop :prog do
  play chord_degree(progression.tick, :c3, :major, 3), release: 4
  sleep 4
end

##| メロディーをスケールからランダムに生成
live_loop :melody do
  16.times do
    play scale(:c4, :major, num_octave: 2).choose, amp: rrand(0.2, 0.6)
    sleep 0.5
  end
end

##| いい感じのレコードノイズのサンプルをループ再生
live_loop :vinalnoise do
  sample :vinyl_hiss, amp: 0.5
  sleep sample_duration :vinyl_hiss
end

##| いい感じのクローズハット
live_loop :hc do
  sample :drum_cymbal_closed, amp: rrand(0.1, 0.2), finish: 0.3 if spread(14, 16).tick
  sleep 0.25
end

##| 配列でスネアの位置を指定してる
a = [0,1,0,0]
live_loop :snare do
  16.times do |i|
    sample :drum_snare_soft, amp: 0.5 if a[i] == 1
    sleep 0.25
    
  end
end
