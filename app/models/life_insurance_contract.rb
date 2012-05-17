class LifeInsuranceContract < ActiveRecord::Base
  belongs_to :life_insurance
  belongs_to :user
  has_many :positions
  attr_accessible :contract_number, :life_insurance_id, :user_id

  def broker
    life_insurance.nil? ? nil : life_insurance.broker
  end

  def insurer
    life_insurance.nil? ? nil : life_insurance.insurer
  end

  def answer_nil
    nil
  end
end
