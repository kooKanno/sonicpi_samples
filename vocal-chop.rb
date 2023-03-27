use_bpm 120

live_loop :beat do
  with_fx :reverb do
    4.times do
      sample :bd_fat
      2.times do
        sleep 0.25
      end
      sample :elec_hi_snare, amp: rrand(0.1, 0.3)
      4.times do
        sample :elec_hi_snare, amp: rrand(0.1, 0.3)
        sleep 0.125
      end
    end
  end
end

live_loop :bass do
  4.times do |i|
    use_random_seed 552
    16.times do
      use_synth :sine
      play chord(:e2, :maj).choose, amp: 0.5, attack: 0, release: 0.8
      sleep [1, 0.5].choose
    end
  end
end



live_loop :vocal_chop do
  with_fx :reverb, mix: 0.3 do
    sample "D:/sonicpi/samples/DS_VDR2_110_kit_loop_what_do_i_do_vocal_female_hook_lead_Bridge_Cm_Dry.wav", num_slices: [32, 64].choose , slice: rrand_i(0, 63) ,amp: 0.3, rate: 1.5, pan: rrand(-0.8, 0.8)
  end
  sleep 0.25
end
