class App
  def checkout(x)
    return -1 if not x =~ /^[A-Z]*$/
    checkout2(x, 0)
  end

  def checkout2(x, initial_price)
    return initial_price if x == ""

    price_table = {
        '5A' => 200,
        '3A' => 130,
        '2E' => { "price": 80, "free": "B" },
        '2B' => 45,
        '2F' => { "price": 20, "free": "F" },
        '1A' => 50,
        '1B' => 30,
        '1C' => 20,
        '1D' => 15,
        '1E' => 40,
        '1F' => 10,
    }

    price_table.each { |pattern, rule|
      sku = pattern[-1]
      pattern_count = pattern[0...-1].to_i

      if x.count(sku) >= pattern_count
        pattern_count.times {
          x.sub!(/#{sku}/, "")
        }
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