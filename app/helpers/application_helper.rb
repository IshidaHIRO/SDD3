module ApplicationHelper
  def first?(target,val1,val2)
     if(!target.integer?)
       return false
     end
     if(val1.integer? && target < val1)
       return false
     end
     if(val2.integer? && target < val2)
       return false
     end
     return true
  end

  def emphasize_first(target,val1,val2)
     if(self.first?(target,val1,val2))
        "<span class='first'>#{target}</span>"
     else
        "#{target}"
     end
  end

   def print_product(target)
     content_tag(:div, :class => 'product') do
       concat content_tag(:p, target.name,:class => 'p_name') 
       concat (content_tag(:dl ,:class => 'dl-horizontal') do
          concat content_tag(:dt,"税込価格")
          concat content_tag(:dd,target.price.to_s + "円")
          concat content_tag(:dt,"熱量")
          concat content_tag(:dd,target.calorie.to_s+"kcal")
          concat content_tag(:dt,"分量")
          concat content_tag(:dd,target.net.to_s+"g")
          concat content_tag(:dt,"タンパク質")
          concat content_tag(:dd,target.protein.to_s+"g")
          concat content_tag(:dt,"脂質")
          concat content_tag(:dd,target.fat.to_s+"g")
          concat content_tag(:dt,"炭水化物")
          concat content_tag(:dd,target.carbon.to_s+"g")
          concat content_tag(:dt,"糖質")
          concat content_tag(:dd,target.sugar.to_s+"g")
          concat content_tag(:dt,"食物繊維")
          concat content_tag(:dd,target.fiber.to_s+"g")
          concat content_tag(:dt,"ナトリウム")
          concat content_tag(:dd,target.sodium.to_s+"mg")
      end)
     end
      
     
    
   end

end
