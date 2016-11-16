module WelcomeHelper
  def print_product(target)
     content_tag(:div, :class => 'product', :id => 'accordion'+target.id.to_s) do
       concat content_tag(:a, target.shop+"  "+target.name,:class => 'p_name', :"data-toggle" => 'collapse', :"data-parent" => '#accordion'+target.shop, :href => '#collapseOne'+target.shop) 
       concat (content_tag(:div, :class => 'spec', :id => 'collapseOne'+target.shop) do 
	 concat image_tag('/images/default01.jpg', :width => '200',:style => 'float :left')
         concat (content_tag(:dl) do
	    concat content_tag(:dt,"税込価格")
	    concat content_tag(:dd,target.price.to_s + "円")
	 end)
       end)
     end
   end
end
