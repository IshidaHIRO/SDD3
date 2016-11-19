module ItemsHelper
  def print_item(item)
     form_tag("/items/vote", method: "post") do
       content_tag(:div, :class => "product", :id => "item_"+item.id.to_s) do
         concat content_tag(:p,item.shop + "  " + item.name,:class => "p_name")
         concat (content_tag(:div, :class => "spec") do
           concat image_tag("/images/default01.jpg", :width => "200",:style => "float :left")
           concat (content_tag(:dl) do
             concat content_tag(:dt,"税込価格")
             concat content_tag(:dd,item.price.to_s + "円")
             concat content_tag(:dt,"☆good")
             concat content_tag(:dd,item.good)
             concat content_tag(:dt,"★bad")
             concat content_tag(:dd,item.bad)
           end)
           concat hidden_field(:item,:id,value:item.id)
           concat submit_tag("GOOD",:name =>"good")
           concat submit_tag("BAD",:name =>"bad")
         end)
       end
     end
   end



end
