class LifeInsuranceContract < ActiveRecord::Base
  #### Associations ####
  belongs_to :life_insurance
  belongs_to :user
  has_many :positions

  #### Accessible Attributes ####
  attr_accessible :contract_number, :life_insurance_id, :user_id

  #### Validations ####
  validates :user_id, :presence => true
  validates :life_insurance_id, :presence => true
  validates :contract_number, :uniqueness => { :scope => :life_insurance_id }

  #### Delegqtions ####
  delegate :name, :to => :life_insurance, :allow_nil => true, :prefix => true

  #### Methods ####
  def broker
    life_insurance.nil? ? nil : life_insurance.broker
  end

  def insurer
    life_insurance.nil? ? nil : life_insurance.insurer
  end

  def answer_nil
    nil
  end

  def to_s
    "#{contract_number} (#{life_insurance_name})"
  end
end
