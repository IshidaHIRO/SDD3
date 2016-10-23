module ApplicationHelper
  def most?(target,val1,val2)
     if(target.nil? || !self.num?(target))
       return false
     end
     if(!val1.nil? && self.num?(val1) && target < val1)
       return false
     end
     if(!val2.nil? && self.num?(val2) && target < val2)
       return false
     end
     return true
  end

  def num?(val)
    val.is_a?(Integer)||val.is_a?(Float)
  end

  def least?(target,val1,val2)
     if(target.nil? || !self.num?(target))
       return false
     end
     if(!val1.nil? && self.num?(val1) && target > val1)
       return false
     end
     if(!val2.nil? && self.num?(val2) && target > val2)
       return false
     end
     return true
  end
  
  def emphasize_most(target,val1,val2)
     if(self.most?(target,val1,val2))
        content_tag(:span,target,:class=>'first')
     else
        "#{target}"
     end
  end

  def emphasize_least(target,val1,val2)
     if(self.least?(target,val1,val2))
        content_tag(:span,target,:class=>'first')
     else
        "#{target}"
     end
  end
  
  def print_product(target,val1,val2)
     content_tag(:div, :class => 'product') do
       concat content_tag(:p, target.name,:class => 'p_name') 
       concat (content_tag(:dl ,:class => 'dl-horizontal') do
          concat content_tag(:dt,"税込価格")
          concat content_tag(:dd,self.emphasize_least(target.price,val1.price,val2.price) + "円")
          concat content_tag(:dt,"熱量")
          concat content_tag(:dd,emphasize_least(target.calorie,val1.calorie,val2.calorie)+"kcal")
          concat content_tag(:dt,"分量")
          concat content_tag(:dd,emphasize_most(target.net,val1.net,val2.net)+"g")
          concat content_tag(:dt,"タンパク質")
          concat content_tag(:dd,emphasize_most(target.protein,val1.protein,val2.protein)+"g")
          concat content_tag(:dt,"脂質")
          concat content_tag(:dd,emphasize_least(target.fat,val1.fat,val2.fat)+"g")
          concat content_tag(:dt,"炭水化物")
          concat content_tag(:dd,emphasize_least(target.carbon,val1.carbon,val2.carbon)+"g")
          concat content_tag(:dt,"糖質")
          concat content_tag(:dd,emphasize_least(target.sugar,val1.sugar,val2.sugar)+"g")
          concat content_tag(:dt,"食物繊維")
          concat content_tag(:dd,emphasize_most(target.fiber,val1.fiber,val2.fiber)+"g")
          concat content_tag(:dt,"ナトリウム")
          concat content_tag(:dd,emphasize_most(target.sodium,val1.sodium,val2.sodium)+"mg")
      end)
     end
      
     
    
   end

end
