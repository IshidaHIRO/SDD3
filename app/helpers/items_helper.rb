module ItemsHelper
  def print_item(item)
     form_tag("/items/vote", method: "post") do
       content_tag(:div, :class => "product clearfix", :id => "item_"+item.id.to_s,) do
         concat content_tag(:p,item.shop + "  " + item.name,:class => "p_name")
         concat (content_tag(:div, :class => "spec") do
           if item.image.blank?
             concat image_tag("/images/default01.jpg", :width => "150",:style => "float :left")
           else
             concat image_tag('/images/'+item.image, :width => "150",:style => "float :left")
           end
           concat (content_tag(:dl) do
             concat content_tag(:dt,"税込価格")
             concat content_tag(:dd,item.price.to_s + "円")
             concat content_tag(:dt,"話題度")
             concat content_tag(:dd,item.good + item.bad)
             concat content_tag(:dt,"good/bad")
             concat content_tag(:dd,item.good.to_s+"/"+item.bad.to_s)
           end)
             concat (content_tag(:div, :style => "margin-left :160px") do 
               concat hidden_field(:item,:id,value:item.id)
               concat submit_tag("GOOD",:name =>"item[good]",:class => "btn btn-lg btn-primary")
               concat submit_tag("BAD",:name =>"item[bad]",:class => "btn btn-lg btn-danger",:style =>"margin-left:20px")
             end)
         end)
       end
     end
   end



end
