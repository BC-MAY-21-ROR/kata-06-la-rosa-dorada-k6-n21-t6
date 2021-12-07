# - Todos los artículos tienen un valor SellIn que indica la cantidad de días que tenemos para vender el artículo.
# - Todos los artículos tienen un valor de Calidad que indica el valor del artículo.
# - Al final de cada día, nuestro sistema reduce ambos valores para cada artículo.


# - CUMPLIDA____Una vez que ha pasado la fecha de caducidad, la calidad se degrada dos veces más rápido
# - CUMPLIDA____La calidad de un artículo nunca es negativa.
# - CUMPLIDA____"Aged Brie" en realidad aumenta en calidad a medida que envejece
# - CUMPLIDA____La calidad de un artículo nunca es superior a 50
# - CUMPLIDA____"Sulfuras", al ser un artículo legendario, nunca tiene que venderse ni disminuye su calidad
# - CUMPLIDA____Los "pases entre bastidores", como el queso brie añejo, aumentan en calidad a medida que se acerca su valor SellIn;
# - CUMPLIDA____La calidad aumenta en 2 cuando hay 10 días o menos y en 3 cuando hay 5 días o menos pero
# - CUMPLIDA____La calidad cae a 0 después del concierto. 


class GildedRose

  def initialize(items)
    @items = items
    @days = 0
  end

  def update_quality()
    @days += 1
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            if item.sell_in == 0
                item.quality = item.quality - 2
            else
                item.quality = item.quality - 1
            end
          end
        end
      else
        if item.quality <= 50
          if item.name != "Aged Brie"
            item.quality = item.quality + 1
          end
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                if item.name != "Aged Brie"
                  item.quality = item.quality + 1
                end
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                if item.name != "Aged Brie"
                 item.quality = item.quality + 1
                end
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        if item.sell_in > 0
          if item.name == "Aged Brie"
            if @days <= 10 && @days > 5 
              item.quality += 2
            elsif @days <= 5
              item.quality += 3
            else  
              item.quality += 1
            end
          end
            item.sell_in = item.sell_in - 1
        elsif item.name == "Aged Brie" 
          item.quality = 0
        end
      end
      # if item.sell_in < 0#solo si el sell_in es menor a 0 que con la condicional q pusimos ya no apsara
      #   if item.name != "Aged Brie"
      #     if item.name != "Backstage passes to a TAFKAL80ETC concert"
      #       if item.quality > 0
      #         if item.name != "Sulfuras, Hand of Ragnaros"
      #           if(item.quality >= 0)
      #             item.quality = item.quality - 1
      #           end
      #         end
      #       end
      #     else
            
      #         item.quality = item.quality - item.quality
            
      #     end
      #   else

      #        item.quality = item.quality + 1
         
      #   end
      # end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    quality > 50 ? @quality = 50 : @quality = quality
    sell_in < 0 ? @sell_in = 0 : @sell_in = sell_in
    @name = name
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
