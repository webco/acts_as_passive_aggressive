module WebCo
  
  module ActsAs
    
    module PassiveAggressive
      
      class Filter
        
        SWEAR_MESSAGES = [
          "I guess only an idiot would use Rails to build applications...",
          "I think only morons use flash[:notice]?",
          "Rails can't scale, did you know that?",
          "PHP rules; so does Python; even Perl is better than Ruby.",
          "Ruby is for sissies...",
          "Rails is the new ASP...",
          "Oh my God, it's a black swan!",
          "Me aDD, pLz XD!!!!!!",
          "People do not need to use Rails to be cool, momma said.",
          "I feel a disturbance in the force: Rails is being used here."
        ]
      
        class << self
         
          def before(controller) 
            @controller = controller
          end
          
          def after(controller)
            swear_at_the_user
          end         
        
          protected
        
          def swear_at_the_user
            if [:delete, :post, :put].include?(@controller.request.method)
              @controller.session[:swear] = true
            else
              if @controller.session[:swear]
                swear_message = SWEAR_MESSAGES[rand(SWEAR_MESSAGES.size)]
                body = @controller.response.body
                match = body.match(/(<body.*?>)/)
                position = match ? match.offset(0).last : body.size
                body.insert position, %(
                  <div style="padding: 10px 0; color: red; font-size: 20pt">
                  #{swear_message}
                  </div>
                )
                @controller.session[:swear] = false
              end
            end
          end
         
        end
        
      end
      
    end
    
  end
  
end