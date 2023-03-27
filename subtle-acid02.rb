use_debug false
load_sample :bd_fat


live_loop :drums do
  sample :bd_fat, amp:5
  sleep 0.5
end

live_loop :closeHat do
  sample :drum_cymbal_closed, attack: rrand(0,0.03), release: rrand(0.08, 0.125), amp: rrand(0.5, 0.8)
  sleep 0.125
end

live_loop :acid do
  4.times do |i|
    use_random_seed 1
    16.times do
      use_synth :tb303
      play scale(:e3, :minor).choose, attack: 0, release: 0.1, cutoff: rrand_i(50, 90) + i * 10, amp: 0.8
      sleep 0.125
    end
  end
end

live_loop :bass do
  4.times do |i|
    use_random_seed 552
    16.times do
      use_synth :tb303
      play chord(:e2, :minor).choose, amp: 0.5, attack: 0, release: 0.125, cutoff: 60
      sleep [0.125, 0.25].choose
    end
  end
end
