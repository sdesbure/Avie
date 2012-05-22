class AccountUnit < ActiveRecord::Base
  include GenericMethods
  #### Associations ####
  has_many :positions, :as => :support

  #### Accessible Attributes ####
  attr_accessible :code, :morningstar_url, :name

  #### Callbacks ####
  before_validation :normalize_name 
  before_validation :normalize_code 

  #### Validations ####
  validates :name, :presence => true
  validates :name, :uniqueness => { :case_sensitive => false }
  validates :code, :uniqueness => true, :allow_nil => true

  #### Methods ####
  def life_insurance_contracts
    positions.map{|p| p.life_insurance_contract}.uniq{|linc| linc.id}
  end

  def life_insurances
    life_insurance_contracts.map{|linc| linc.life_insurance}.uniq{|li| li.id}
  end

  def users
    positions.map{|p| p.user}.uniq{|u| u.id}
  end

  private
  def normalize_code
    self.code = code.strip unless code.nil?
  end
end
