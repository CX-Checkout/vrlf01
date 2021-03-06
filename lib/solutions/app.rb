class App
  def checkout(x)
    return -1 if not x =~ /^[A-Z]*$/
    checkout2(x, 0)
  end

  def checkout2(x, initial_price)
    return initial_price if x == ""

    price_table = {
        'multibuy1_' => {"price": 45, "occurence": 3, "options": "STXYZ"},
        '5A'  => 200,
        '3A'  => 130,
        '2E'  => { "price": 80, "free": "B" },
        '2B'  => 45,
        '2F'  => { "price": 20, "free": "F" },
        '10H' => 80,
        '5H'  => 45,
        '2K'  => 120,
        '3N'  => { "price": 120, "free": "M" },
        '5P'  => 200,
        '3R'  => { "price": 150, "free": "Q" },
        '3Q'  => 80,
        '3U'  => { "price": 120, "free": "U" },
        '3V'  => 130,
        '2V'  => 90,
        '1A'  => 50,
        '1B'  => 30,
        '1C'  => 20,
        '1D'  => 15,
        '1E'  => 40,
        '1F'  => 10,
        '1G'  => 20,
        '1H'  => 10,
        '1I'  => 35,
        '1J'  => 60,
        '1K'  => 70,
        '1L'  => 90,
        '1M'  => 15,
        '1N'  => 40,
        '1O'  => 10,
        '1P'  => 50,
        '1Q'  => 30,
        '1R'  => 50,
        '1S'  => 20,
        '1T'  => 20,
        '1U'  => 40,
        '1V'  => 50,
        '1W'  => 20,
        '1X'  => 17,
        '1Y'  => 20,
        '1Z'  => 21,
    }

    price_table.each { |pattern, rule|
      multibuy = false

      sku = pattern[-1]
      if sku == "_"
        sku = rule[:options]
        pattern_count = rule[:occurence]
      else
        pattern_count = pattern[0...-1].to_i
      end

      if x.count(sku) >= pattern_count
        if not multibuy
          pattern_count.times {
            x.sub!(/#{sku}/, "")
          }
        else
          occurence = rule[:occurence]
          while occurence > 0
            rule[:options].each { |option|
              if x.count(option) > 0
                x.count(option).times {
                  x.sub!(/#{option}/, "")
                  occurence -= 1
                }
              end
            }
          end
        end
        case rule.class.to_s
          when "Fixnum"
            return checkout2(x, initial_price + rule)
          when "Hash"
            if rule[:free]
              x.sub!(/#{rule[:free]}/, "")
            end
            return checkout2(x, initial_price + rule[:price])
          else
            return -1

        end
      end
    }
    return -1
  end
end