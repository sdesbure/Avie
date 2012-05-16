class LifeInsurance < ActiveRecord::Base
  belongs_to :broker
  belongs_to :insurer
  attr_accessible :name, :website
end
