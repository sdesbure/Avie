class LifeInsurance < ActiveRecord::Base
  include GenericMethods
  #### Associations ####
  belongs_to :broker
  belongs_to :insurer
  has_many :life_insurance_contracts

  #### Accessible Attributes ####
  attr_accessible :name, :website, :insurer_id, :broker_id

  #### Validations ####
  validates :broker_id, :presence => true
  validates :insurer_id, :presence => true
  validates :name, :presence => true
  validates :name, :uniqueness => { :case_sensitive => false }

  #### Callbacks ####
  before_validation :normalize_name 

  #### Methods ####
end
