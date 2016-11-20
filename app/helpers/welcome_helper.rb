module WelcomeHelper
  def print_product(target,index)
     link = '/items/'+target.id.to_s
     content_tag(:div, :class => 'product clearfix', :id => target.id.to_s) do
       concat (content_tag(:span,:class => 'rank'+index) do
         concat content_tag(:span,index+"位",:class => 'rank')
         concat content_tag(:span,target.shop,:class => 'shop')
         concat content_tag(:a, target.name,:class => 'p_name', :href => link) 
       end)
       concat (content_tag(:div, :class => 'spec', :id => 'collapseOne'+target.shop) do 
         if target.image.blank?
           concat image_tag('/images/default01.jpg', :width => '150',:style => "float :left")
         else
	   concat content_tag(:a,image_tag('/images/'+target.image, :width => '150',:style => "float :left"),:href => link)
         end
         concat (content_tag(:dl) do
<<<<<<< HEAD
	    concat content_tag(:dt,"税込価格")
	    concat content_tag(:dd,target.price.to_s + "円")
             concat content_tag(:dt,"☆good")
             concat content_tag(:dd,item.good)
             concat content_tag(:dt,"★bad")
             concat content_tag(:dd,item.bad)
           end)
           concat hidden_field(:item,:id,value:item.id)
           concat submit_tag("GOOD",:name =>"good")
           concat submit_tag("BAD",:name =>"bad")
=======
	    concat content_tag(:dt,"税込価格", :style => "float :left")
	    concat content_tag(:dd,target.price.to_s + "円", :style => "margin-left :80px")
            concat content_tag(:dt,"話題度", :style => "float :left")
            concat content_tag(:dd,target.good + target.bad, :style => "margin-left :80px")
            concat content_tag(:dt,"good/bad", :style => "float :left")
            concat content_tag(:dd,target.good.to_s+"/"+target.bad.to_s, :style => "margin-left :80px")
>>>>>>> 54182f453709f10ba1dab20e97238cc42e7659ca
	 end)
         concat link_to('商品の詳細を見る',link, :style => "margin-left :10px")
       end)
     end
   end
end
