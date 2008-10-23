module WebCo
  
  module ActsAs
    
    module PassiveAggressive
      
      def acts_as_passive_aggressive
        self.around_filter WebCo::ActsAs::PassiveAggressive::Filter
      end
            
    end
    
  end
  
end