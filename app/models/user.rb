class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me  

  has_many :positions
  has_many :life_insurance_contracts, :dependent => :destroy

  def life_insurances
    life_insurance_contracts.map{|lic| lic.life_insurance}.uniq{|li| li.id}
  end

  def brokers
    life_insurances.map{|li| li.broker}.uniq{|b| b.id}
  end

  def insurers
    life_insurances.map{|li| li.insurer}.uniq{|i| i.id}
  end

  def contracts(contract_owner)
    unless contract_owner.nil?
      method = "life_insurance" if  contract_owner.kind_of? LifeInsurance
      method = "broker" if  contract_owner.kind_of? Broker
      method = "insurer" if  contract_owner.kind_of? Insurer
      method ||= "answer_nil"
      life_insurance_contracts.select{|lic| lic.send(method).id == contract_owner.id}
    else
      []
    end
  end
end
