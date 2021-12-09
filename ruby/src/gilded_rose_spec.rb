require File.join(File.dirname(__FILE__), 'gilded_rose')
require File.join(File.dirname(__FILE__), 'product')

describe GildedRose do
  describe "#update_quality_first" do
    it "this will update quality depending if is aged brie and if is not backstage" do
      items = Product.new(name="Aged Brie", sell_in=20, quality=20)
      instancia = GildedRose.new(items)
      out = instancia.update_quality_first(items)
      expect(out).to eq(20)
    end
  end

  describe "#update_quality_second" do
    it "this will update sell_in depending if is not aged brie sulfuras" do
      items = Product.new(name="Elixir of the Mongoose", sell_in=20, quality=20)
      instancia = GildedRose.new(items)
      out = instancia.update_quality_second(items)
      expect(out).to eq(19)
    end
  end

  #verifications of the class product.rb
  
  describe "#initialize product class" do
    it "this method will initialize the atributes of the product class" do
      items = Product.new(name="Elixir of the Mongoose", sell_in=20, quality=20)
      instancia = GildedRose.new(items)
      out = instancia.update_quality_second(items)
      expect(out).to eq(19)
    end
  end






  #Verifications if the name of the item if is the correct
  describe "#verificate_aged_brie" do
    it "verification_name_aged_brie" do
      instancia = GildedRose.new(0)
      correct = instancia.verificate_aged_brie("Aged Brie")
      incorrect = instancia.verificate_aged_brie("")
      expect(correct).to eq true
      expect(incorrect).to eq false
    end
  end

  describe "#verificate_backstage" do
    it "verification_name_Backstage" do
      instancia = GildedRose.new(0)
      correct = instancia.verificate_backstage("Backstage passes to a TAFKAL80ETC concert")
      incorrect = instancia.verificate_backstage("")
      expect(correct).to eq true
      expect(incorrect).to eq false
    end
  end

  describe "#verificate_sulfuras" do
    it "verification_name_sulfuras" do
      instancia = GildedRose.new(0)
      correct = instancia.verificate_sulfuras("Sulfuras, Hand of Ragnaros")
      incorrect = instancia.verificate_sulfuras("")
      expect(correct).to eq true
      expect(incorrect).to eq false
    end
  end

end




