class EuroFund < ActiveRecord::Base
  attr_accessible :name

  has_many :positions, :as => :support

  def life_insurance_contracts
    positions.map{|p| p.life_insurance_contract}.uniq{|linc| linc.id}
  end

  def life_insurances
    life_insurance_contracts.map{|linc| linc.life_insurance}.uniq{|li| li.id}
  end

  def users
    positions.map{|p| p.user}.uniq{|u| u.id}
  end

end

