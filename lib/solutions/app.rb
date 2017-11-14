class App
  def checkout(x)
    price_table = {
        'A'  => 50,
        '3A' => 130,
        'B'  => 30,
        '2B' => 45,
        'C'  => 20,
        'D'  => 15,
    }

    frequency = Hash.new(0)
    patternized = x.split("").sort.join.gsub(/AAA/, "3A").gsub(/BB/, "2B").gsub(/([A-Z])/, "\\1\n")
    patternized.lines.each { |sku| frequency[sku.strip] += 1 }

    price = 0
    frequency.each { |key, count|
        begin
            price += price_table[key] * count
        rescue
            price = -1
        end
    }

    price
  end
end