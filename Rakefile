
# irb(main):060:0> "0x8feeb1".to_i(16).chr(Encoding::EUC_JIS_2004).encode('utf-8')

def main
  {
    '区' => ['点', 'begin', 'end']
  }

  # jis_level_1_kanji_set_codepoints = begin
  #                                      x = (16..46).map { |ku|
  #                                        (1..94).map { |ten|
  #                                          b1 = ku + 0xa0
  #                                          b2 = ten + 0xa0
  #                                          b = "0x#{b1.to_s(16)}#{b2.to_s(16)}"
  #                                          # puts b.to_i(16).chr(Encoding::EUC_JIS_2004).encode(Encoding::UTF_8)
  #                                        }
  #                                      }.flatten
  #                                      y = [47].map { |ku|
  #                                        (1..51).map { |ten|
  #                                          b1 = ku + 0xa0
  #                                          b2 = ten + 0xa0
  #                                          b = "0x#{b1.to_s(16)}#{b2.to_s(16)}"
  #                                          # puts b.to_i(16).chr(Encoding::EUC_JIS_2004).encode(Encoding::UTF_8)
  #                                        }
  #                                      }.flatten
  #                                      x + y
  #                                    end

  # [
  #   [面, 区, 点],
  #   [面, 区, 点],
  #   ...
  # ]
  jis_level_1_kanji_set_codepoints = [].tap do |array|
    [1].each do |men| 
      (16..46).each do |ku|
        (1..94).each do |ten|
          array << [men, ku, ten]
          # b1 = ku + 0xa0
          # b2 = ten + 0xa0
          # b = "0x#{b1.to_s(16)}#{b2.to_s(16)}"
          # array << b
        end
      end
    end
    [1].each do |men| 
      [47].each do |ku|
        (1..51).each do |ten|
          array << [men, ku, ten]
          # b1 = ku + 0xa0
          # b2 = ten + 0xa0
          # b = "0x#{b1.to_s(16)}#{b2.to_s(16)}"
          # array << b
        end
      end
    end
  end

  jis_level_1_kanji_set_hex_euc_jis_2004 = jis_level_1_kanji_set_codepoints.map { |codepoint|
    men, ku, ten = *codepoint
    b1 = ku + 0xa0
    b2 = ten + 0xa0
    if men == 2
      b = "0x8f#{b1.to_s(16)}#{b2.to_s(16)}"
    else
      b = "0x#{b1.to_s(16)}#{b2.to_s(16)}"
    end
    b
  }

  chars = jis_level_1_kanji_set_hex_euc_jis_2004.map { |hex|
    p hex
    hex.to_i(16).chr(Encoding::EUC_JIS_2004).encode(Encoding::UTF_8)
  }
  # p chars.join
  # chars.each do |char|
  #   p char.ord
  # end
  xs = chars.map(&:ord).sort
  p xs

  # (16..46).each do |ku|
  #   (1..94).each do |ten|
  #     b1 = ku + 0xa0
  #     b2 = ten + 0xa0
  #     b = "0x#{b1.to_s(16)}#{b2.to_s(16)}"
  #     puts b.to_i(16).chr(Encoding::EUC_JIS_2004).encode(Encoding::UTF_8)
  #   end
  # end

  # ku = 47
  # (1..51).each do |ten|
  #   b1 = ku + 0xa0
  #   b2 = ten + 0xa0
  #   b = "0x#{b1.to_s(16)}#{b2.to_s(16)}"
  #   puts b.to_i(16).chr(Encoding::EUC_JIS_2004).encode(Encoding::UTF_8)
  # end
end

if defined?(Rake)
  desc ''
  task :default do
    main
  end
else
  main
end
