
# irb(main):060:0> "0x8feeb1".to_i(16).chr(Encoding::EUC_JIS_2004).encode('utf-8')

# http://www.asahi-net.or.jp/~ax2s-kmtn/ref/jisx0208.html
# http://www.asahi-net.or.jp/~ax2s-kmtn/ref/jisx0212/index.html
# http://www.asahi-net.or.jp/~ax2s-kmtn/ref/jisx0213/index.html

require 'pp'


JIS_X_0208_KANJI_1_REGEXP = /\A
                        [\xB0\xA1-\xB0\xFE] | # 1-16-1 .. 1-16-94
                        [\xB1\xA1-\xB1\xFE] | # 1-17-1 .. 1-17-94
                        [\xB2\xA1-\xB2\xFE] | # 1-18-1 .. 1-18-94
                        [\xB3\xA1-\xB3\xFE] | # 1-19-1 .. 1-19-94
                        [\xB4\xA1-\xB4\xFE] | # 1-20-1 .. 1-20-94
                        [\xB5\xA1-\xB5\xFE] | # 1-21-1 .. 1-21-94
                        [\xB6\xA1-\xB6\xFE] | # 1-22-1 .. 1-22-94
                        [\xB7\xA1-\xB7\xFE] | # 1-23-1 .. 1-23-94
                        [\xB8\xA1-\xB8\xFE] | # 1-24-1 .. 1-24-94
                        [\xB9\xA1-\xB9\xFE] | # 1-25-1 .. 1-25-94
                        [\xBA\xA1-\xBA\xFE] | # 1-26-1 .. 1-26-94
                        [\xBB\xA1-\xBB\xFE] | # 1-27-1 .. 1-27-94
                        [\xBC\xA1-\xBC\xFE] | # 1-28-1 .. 1-28-94
                        [\xBD\xA1-\xBD\xFE] | # 1-29-1 .. 1-29-94
                        [\xBE\xA1-\xBE\xFE] | # 1-30-1 .. 1-30-94
                        [\xBF\xA1-\xBF\xFE] | # 1-31-1 .. 1-31-94
                        [\xC0\xA1-\xC0\xFE] | # 1-32-1 .. 1-32-94
                        [\xC1\xA1-\xC1\xFE] | # 1-33-1 .. 1-33-94
                        [\xC2\xA1-\xC2\xFE] | # 1-34-1 .. 1-34-94
                        [\xC3\xA1-\xC3\xFE] | # 1-35-1 .. 1-35-94
                        [\xC4\xA1-\xC4\xFE] | # 1-36-1 .. 1-36-94
                        [\xC5\xA1-\xC5\xFE] | # 1-37-1 .. 1-37-94
                        [\xC6\xA1-\xC6\xFE] | # 1-38-1 .. 1-38-94
                        [\xC7\xA1-\xC7\xFE] | # 1-39-1 .. 1-39-94
                        [\xC8\xA1-\xC8\xFE] | # 1-40-1 .. 1-40-94
                        [\xC9\xA1-\xC9\xFE] | # 1-41-1 .. 1-41-94
                        [\xCA\xA1-\xCA\xFE] | # 1-42-1 .. 1-42-94
                        [\xCB\xA1-\xCB\xFE] | # 1-43-1 .. 1-43-94
                        [\xCC\xA1-\xCC\xFE] | # 1-44-1 .. 1-44-94
                        [\xCD\xA1-\xCD\xFE] | # 1-45-1 .. 1-45-94
                        [\xCE\xA1-\xCE\xFE] | # 1-46-1 .. 1-46-94
                        [\xCF\xA1-\xCF\xD3] | # 1-47-1 .. 1-47-51
                        \z/xoe

JIS_X_0208_KANJI_2_REGEXP = /\A
                            [\xD0A1-\xD0FE] | # 1-48-1 .. 1-48-94
                            [\xD0A1-\xD0FE] | # 1-48-1 .. 1-48-94
                            \z/xoe

def main(regexp)
  # A1A0 .. F4AF
  (1..84).each do |x|
    (0..95).each do |y|
      a = x + 0xa0
      b = y + 0xa0
      aa = a.to_s(16)
      bb = b.to_s(16)
      c = "0x#{aa}#{bb}"
      cc = Integer(c)

      begin
        d = cc.chr(Encoding::EUC_JIS_2004)
        dd = d.force_encoding(Encoding::EUC_JP)
        p regexp.match(dd)
      rescue RangeError => err
        # p err
      end
    end
  end
end

main(JIS_X_0208_KANJI_1_REGEXP)
