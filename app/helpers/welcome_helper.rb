module WelcomeHelper
  def print_product(target,index)
     link = '/items/'+target.id.to_s
     len_cmt = 60
     target_review = ItemReview.where(item_id: target.id).order('created_at DESC').first
     if target_review.nil?
       target_handlename = ""
       target_comment = "コメントはまだありません"
     else
       target_handlename = target_review.handlename+" さん"
       if target_review.comment.length > len_cmt
         target_comment = target_review.comment[0, len_cmt]+"…"
       else
         target_comment = target_review.comment
       end
     end
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
	    concat content_tag(:dt,"税込価格", :style => "float :left", :class => 'price_dt')
	    concat content_tag(:dd,target.price.to_s + "円", :style => "margin-left :80px", :class => 'price_dd')
            concat content_tag(:dt,"話題度", :style => "float :left", :class => 'topic_dt')
            concat content_tag(:dd,target.good + target.bad, :style => "margin-left :80px", :class => 'topic_dd')
            concat content_tag(:dt,"good/bad", :style => "float :left", :class => 'good_bad_dt')
            concat content_tag(:dd,target.good.to_s+"/"+target.bad.to_s, :style => "margin-left :80px", :class => 'good_bad_dd')
            concat content_tag(:dt,"コメント", :style => "float :left", :class => 'comment_dt')
            concat content_tag(:dd,target_handlename, :style => "margin-left :80px", :class => 'comment_hn_dd')
            concat content_tag(:dd,target_comment, :style => "margin-left :80px", :class => 'comment_dd')
	 end)
         concat link_to('商品の詳細を見る',link, :style => "margin-left :10px")
       end)
     end
   end
end
