module WelcomeHelper
  def print_product(target)
     link = '/items/view/'+target.name+'?shop='+target.shop
     content_tag(:div, :class => 'product clearfix', :id => 'accordion'+target.id.to_s) do
       concat content_tag(:a, target.shop+"  "+target.name,:class => 'p_name', :href => link) 
       concat (content_tag(:div, :class => 'spec', :id => 'collapseOne'+target.shop) do 
         if target.image.blank?
           concat image_tag('/images/default01.jpg', :width => '150',:style => "float :left")
         else
	   concat content_tag(:a,image_tag('/images/'+target.image, :width => '150',:style => "float :left"),:href => link)
         end
         concat (content_tag(:dl) do
	    concat content_tag(:dt,"税込価格", :style => "float :left")
	    concat content_tag(:dd,target.price.to_s + "円", :style => "margin-left :80px")
            concat content_tag(:dt,"話題度", :style => "float :left")
            concat content_tag(:dd,target.good + target.bad, :style => "margin-left :80px")
            concat content_tag(:dt,"good/bad", :style => "float :left")
            concat content_tag(:dd,target.good.to_s+"/"+target.bad.to_s, :style => "margin-left :80px")
	 end)
         concat link_to('商品の詳細を見る',link, :style => "margin-left :10px")
       end)
     end
   end
end
