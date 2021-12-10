# frozen_string_literal: true

# Class to receive all products and update the quality
class GildedRose
  def initialize(items)
    @items = items
    @days = 0
  end

  def verificate_aged_brie(name)
    name == 'Aged Brie' ? true : false
  end

  def verificate_backstage(name)
    name == 'Backstage passes to a TAFKAL80ETC concert' ? true : false
  end

  def verificate_sulfuras(name)
    name == 'Sulfuras, Hand of Ragnaros' ? true : false
  end

  def update_quality_first(item)
    quality = item.quality
    sell_in = item.sell_in
    name = item.name
    if !verificate_aged_brie(name) && !verificate_backstage(name)
        item.sell_in.zero? ? quality - 2 : quality - 1  if quality.positive? && !verificate_sulfuras(name)
    elsif quality <= 50
      quality = quality + 1 if !verificate_aged_brie(name)
      quality = quality + 1 if sell_in < 11 && (quality < 50) && (!verificate_aged_brie(name))  if verificate_backstage(name)
      quality = quality + 1 if sell_in < 6 && (quality < 50) && (!verificate_aged_brie(name))  if verificate_backstage(name)
    end
  end

  def update_quality_second(item)
    quality = item.quality
    sell_in = item.sell_in
    name = item.name
    if !verificate_sulfuras(name)
      if sell_in.positive?
        if verificate_aged_brie(name)
         quality = quality + 2 if @days <= 10 && @days > 5
         quality = quality + 3 if @days <= 5
         quality = quality + 1 if @days > 10
        end
        sell_in = sell_in - 1
      elsif verificate_aged_brie(name)
        quality = 0
      end
    end
  end

  def iterate_products
    @days += 1
    @items.each do |item|
      update_quality_first(item)
      update_quality_second(item)
    end
    @concat = "#{@days.to_i}, #{@items.length.to_i}"
  end
end