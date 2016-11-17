module WelcomeHelper
  def print_product(target)
     link = '/items/view/'+target.name+'?shop='+target.shop
     content_tag(:div, :class => 'product', :id => 'accordion'+target.id.to_s) do
       concat content_tag(:a, target.shop+"  "+target.name,:class => 'p_name', :href => link) 
       concat (content_tag(:div, :class => 'spec', :id => 'collapseOne'+target.shop) do 
	 concat content_tag(:a,image_tag('/images/default01.jpg', :width => '200',:style => 'float :left'),:href => link)
         concat (content_tag(:dl) do
	    concat content_tag(:dt,"税込価格")
	    concat content_tag(:dd,target.price.to_s + "円")
	 end)
         concat link_to('商品の詳細を見る',link)
       end)
     end
   end
end
