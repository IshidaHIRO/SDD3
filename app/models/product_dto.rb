class Product_dto 
  include ActiveModel::Model
  
  attr_accessor :id,:shop,:category,:item,:name,:price,:calorie,:net,:protein,:fat,:carbon,:sugar,:fiber,:sodium,:tweets_count_all,:tweets_count_good,:tweets_count_bad
  
  def initialize(id,shop,category,name,price)
    @id=id
    @shop=shop
    @category=category
    @name=name
    @price=price
  end
end
