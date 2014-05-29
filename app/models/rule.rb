class Rule < ActiveRecord::Base
  belongs_to :failure_mode
  belongs_to :property
end
