class Insurer < ActiveRecord::Base
  include GenericMethods
  #### Associations ####
  has_many :life_insurances
  has_many :life_insurance_contracts, :through => :life_insurances

  #### Accessible Attributes ####
  attr_accessible :name, :website

  #### Validations ####
  validates :name, :presence => true
  validates :name, :uniqueness => { :case_sensitive => false }

  #### Callbacks ####
  before_validation :normalize_name 

  #### Methods ####
  def self.best_insurers(nb=5)
    Insurer.all.map{|i| [i, i.life_insurance_contracts.count]}.sort{|x,y| y.last <=> x.last}[0..(nb - 1)]
  end
end
