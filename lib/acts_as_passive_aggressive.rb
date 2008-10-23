require "acts_as_passive_aggressive/filter"
require "acts_as_passive_aggressive/injection"

ActionController::Base.extend(WebCo::ActsAs::PassiveAggressive)
