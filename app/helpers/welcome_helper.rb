module WelcomeHelper
  def print_product(target,index)
     link = '/items/'+target.id.to_s
     target_review = ItemReview.where(item_id: target.id).order('created_at DESC').first
     if target_review.nil?
       target_handlename = ""
       target_comment = "コメントはまだありません"
     else
       target_handlename = target_review.handlename+" さん"
       target_comment = target_review.comment 
     end
     content_tag(:div, :class => 'product clearfix', :id => target.id.to_s) do
       concat (content_tag(:span,:class => 'rank'+index) do
         if index == "1" || index =="2" || index == "3"
           concat image_tag('/images/ranking_'+index+'_60.png',:class=>'rank_image')
         else 
           concat content_tag(:span,index+"位",:class => 'rank')
         end
         concat content_tag(:span,target.shop,:class => 'shop')
         concat content_tag(:a, target.name,:class => 'p_name', :href => link) 
       end)
       concat (content_tag(:div, :class => 'spec', :id => 'collapseOne'+target.shop) do 
         if target.image.blank?
	   concat content_tag(:a,image_tag('/images/default01.jpg'),:href => link)
         else
	   concat content_tag(:a,image_tag('/images/'+target.image),:href => link)
         end
         concat (content_tag(:dl) do
	    concat content_tag(:dt,"税込価格", :class => 'price_dt')
	    concat content_tag(:dd,target.price.to_s + "円", :class => 'price_dd')
            concat content_tag(:dt,"話題度", :class => 'topic_dt')
            concat content_tag(:dd,target.good + target.bad, :class => 'topic_dd')
            concat content_tag(:dt,"good/bad", :class => 'good_bad_dt')
            concat content_tag(:dd,target.good.to_s+"/"+target.bad.to_s, :class => 'good_bad_dd')
            concat content_tag(:dt,"コメント", :class => 'comment_dt')
            concat content_tag(:dd,target_handlename, :class => 'comment_hn_dd')
            concat content_tag(:dd,target_comment, :class => 'comment_dd')
	 end)
         concat link_to('商品の詳細を見る',link, :style => "margin-left :10px")
       end)
     end
   end
end
