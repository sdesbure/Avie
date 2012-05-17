class Insurer < ActiveRecord::Base
  attr_accessible :name, :website
  has_many :life_insurances
  has_many :life_insurance_contracts, :through => :life_insurances

  def self.best_insurers(nb=5)
    Insurer.all.map{|i| [i, i.life_insurance_contracts.count]}.sort{|x,y| y.last <=> x.last}[0..(nb - 1)]
  end
end
