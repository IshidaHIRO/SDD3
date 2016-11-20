module ItemsHelper
  def print_item(item)
     form_tag("/items/vote", method: "post") do
       content_tag(:div, :class => "product clearfix", :id => "item_"+item.id.to_s,) do
         concat content_tag(:p,item.shop + "  " + item.name,:class => "p_name")
         concat (content_tag(:div, :class => "spec") do
##           concat image_tag("/images/default01.jpg", :width => "200",:style => "float :left")
           concat image_tag("/images/"+item.image, :width => "150",:style => "float :left")
           concat (content_tag(:dl) do
             concat content_tag(:dt,"税込価格", :style => "float :left")
             concat content_tag(:dd,item.price.to_s + "円", :style => "margin-left :80px")
             concat content_tag(:dt,"話題度", :style => "float :left")
             concat content_tag(:dd,item.good + item.bad, :style => "margin-left :80px")
             concat content_tag(:dt,"good/bad", :style => "float :left")
             concat content_tag(:dd,item.good.to_s+"/"+item.bad.to_s, :style => "margin-left :80px")
           end)
             concat hidden_field(:item,:id,value:item.id)
             concat submit_tag("GOOD",:name =>"good")
             concat submit_tag("BAD",:name =>"bad")
         end)
       end
     end
   end



end
