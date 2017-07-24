def f(ku, ten)
  begin
    e1 = (ku + 0xa0).to_s(16)
    e2 = (ten + 0xa0).to_s(16)
    ex = "0x#{e1}#{e2}"

    e = Integer(ex).chr(Encoding::EUC_JIS_2004)
    u = e.encode(Encoding::UTF_8)

    [e1, e2, ex, e, u]
    p [e1, e2, ex, e, u]
  rescue RangeError, Encoding::UndefinedConversionError => err
  end
end

def check()
end



jis_x_0208_not_kanji = [].tap do |array|
    # 1-1
    [1].each do |men|
      [1].each do |ku|
        (1..94).each do |ten|
          array << f(ku, ten)
        end
      end
    end

    # 1-2
    [1].each do |men|
      [2].each do |ku|
        tmp = []
        tmp += (1..14).to_a
        tmp += (26..33).to_a
        tmp += (42..48).to_a
        tmp += (60..74).to_a
        tmp += (82..89).to_a
        tmp << 94

        tmp.each do |ten|
          array << f(ku, ten)
        end
      end
    end

    # 1-3
    [1].each do |men|
      [3].each do |ku|
        tmp = []
        tmp += (16..25).to_a
        tmp += (33..58).to_a
        tmp += (65..90).to_a

        tmp.each do |ten|
          array << f(ku, ten)
        end
      end
    end

    # 1-4
    [1].each do |men|
      [4].each do |ku|
        (1..83).each do |ten|
          array << f(ku, ten)
        end
      end
    end

    # 1-5
    [1].each do |men|
      [5].each do |ku|
        (1..86).each do |ten|
          array << f(ku, ten)
        end
      end
    end

    # 1-6
    [1].each do |men|
      [6].each do |ku|
        tmp = []
        tmp += (1..24).to_a
        tmp += (33..56).to_a

        tmp.each do |ten|
          array << f(ku, ten)
        end
      end
    end

    # 1-7
    [1].each do |men|
      [7].each do |ku|
        tmp = []
        tmp += (1..33).to_a
        tmp += (49..81).to_a

        tmp.each do |ten|
          array << f(ku, ten)
        end
      end
    end

    # 1-8
    [1].each do |men|
      [8].each do |ku|
        (1..32).each do |ten|
          array << f(ku, ten)
        end
      end
    end


      jis_x_0208_kanji_1 = [].tap do |array|
    # 1-16 ... 1-46
    [1].each do |men|
      (16..46).each do |ku|
        (1..94).each do |ten|
          array << f(ku, ten)
        end
      end
    end

    # 1-47
    [1].each do |men|
      [47].each do |ku|
        (1..51).each do |ten|
          array << f(ku, ten)
        end
      end
    end
  end

  jis_x_0208_kanji_2 = [].tap do |array|
    # 1-48 ... 1-83
    [1].each do |men|
      (48..83).each do |ku|
        (1..94).each do |ten|
          array << f(ku, ten)
        end
      end
    end

    # 1-84
    [1].each do |men|
      [84].each do |ku|
        (1..6).each do |ten|
          array << f(ku, ten)
        end
      end
    end
  end

  # check
  [1].each do |men|
    (1..84).each do |ku|
      (0..95).each do |ten|

      end
    end
  end

  exit

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

  # jis_level_1_kanji_set_hex_euc_jis_2004 = jis_level_1_kanji_set_codepoints.map { |codepoint|
  #   men, ku, ten = *codepoint
  #   b1 = ku + 0xa0
  #   b2 = ten + 0xa0
  #   if men == 2
  #     b = "0x8f#{b1.to_s(16)}#{b2.to_s(16)}"
  #   else
  #     b = "0x#{b1.to_s(16)}#{b2.to_s(16)}"
  #   end
  #   b
  # }

  # chars = jis_level_1_kanji_set_hex_euc_jis_2004.map { |hex|
  #   hex.to_i(16).chr(Encoding::EUC_JIS_2004).encode(Encoding::UTF_8)
  # }
  # p chars.join
  # chars.each do |char|
  #   p char.ord
  # end
  # xs = chars.map(&:ord).sort
  # p xs.first
  # p xs.first.chr(Encoding::UTF_8)
  # p xs.last.chr(Encoding::UTF_8)

  # x = xs.first.chr(Encoding::UTF_8)
  # p x
  # loop do
  #   x = x.succ
  #   p x.ord
  # end

  # # (16..46).each do |ku|
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

