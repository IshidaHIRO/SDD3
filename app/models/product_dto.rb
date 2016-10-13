class Product_dto 
  include ActiveModel::Model
  
  attr_accessor :shop,:category,:item,:name,:price,:calorie,:image_url,:twitter
  
  def initialize(shop,category,item,name,price,calorie,image_url)
    @shop=shop
    @category=category
    @item=item
    @name=name
    @price=price
    @calorie=calorie
    @image_url=image_url
  end
  
end
