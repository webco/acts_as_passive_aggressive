require "acts_as_passive_aggressive/filter"
require "acts_as_passive_aggressive/injection"

ActionController::Base.extend(WebCo::ActsAs::PassiveAggressive)

# Enable it by default for all controller in development mode
if RAILS_ENV == "development"
  ActionController::Base.class_eval do
    acts_as_passive_aggressive
  end
end
