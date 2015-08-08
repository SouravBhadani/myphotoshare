module ApplicationHelper
    def likes_detail(klass)
        @content =  if user_signed_in?
                        if current_user.like! klass
                          link_to pin_like_path(likable_type: klass.class.to_s,id: klass.id),class: 'glyphicon glyphicon-heart',style:"color:red",remote: true ,method: "POST"  do
                            #contant_tag :span ,class: 'glyphicon glyphicon-heart',style:"color:red"
                          end
                        else
                          link_to pin_like_path(likable_type: klass.class.to_s,id: klass.id),class: 'glyphicon glyphicon-heart',style:"color:white",remote: true ,method: "POST"  do
                           # contant_tag :span ,class: 'glyphicon glyphicon-heart' ,style:"color:white"
                          end
                        end 
                    else  
                        link_to "javascript:void(0);",class: 'glyphicon glyphicon-heart',style:"color:blue" do
                           # contant_tag :span ,class: 'glyphicon glyphicon-heart',style:"color:blue"
                        end                    
                    end 
        like_count = klass.likers(User).count
        if  like_count > 0            
            @content + link_to(like_count,"javascript:void(0);", :class => "follower_notifications commen_like_module my_popup2_open pos-like",remote: true) 
        else  
            @content
        end   
    end
                     
    def like_for(klass ,div_style = {})
        div_style[:style] = div_style[:style] || "margin:9px 10px 0 0px;"
        div_style[:class] = div_style[:class] || "" 
        content_tag :div ,:id=> "#{klass.class.to_s}_#{klass.id.to_s}" ,:style => div_style[:style] , :class => div_style[:class] do 
          likes_detail(klass) 
        end
    end
end

