class LifeInsurance < ActiveRecord::Base
  belongs_to :broker
  belongs_to :insurer
  has_many :life_insurance_contracts
  attr_accessible :name, :website, :insurer_id, :broker_id
end
