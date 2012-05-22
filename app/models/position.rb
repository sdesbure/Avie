class Position < ActiveRecord::Base
  #### Associations ####
  belongs_to :user
  belongs_to :support, :polymorphic => true
  belongs_to :life_insurance_contract

  #### Accessible Attributes ####
  attr_accessible :buy_date, :buy_price, :sell_date, :sell_price, :price_paid, :life_insurance_contract_id, :user_id, :support_id, :support_type

  #### Scopes ####
  scope :active, where(:sell_date => nil)

  #### Constants ####
  SUPPORTS_WHITE_LIST=[:euro_fund, :account_unit]

  #### Validations ####
  validates :user_id, :presence => true
  validates :support_id, :presence => true
  validates :life_insurance_contract_id, :presence => true

  #### Delegations ####
  delegate :name, :to => :user, :allow_nil => true, :prefix => true
  delegate :name, :to => :support, :allow_nil => true, :prefix => true
  delegate :to_s, :to => :life_insurance_contract, :allow_nil => true, :prefix => true

  #### Methods ####
  def self.best_gains(nb=5)
    best_results = Position.connection.select_all("SELECT (sell_price - buy_price) as gain, id from `positions` WHERE sell_price NOT NULL ORDER BY gain DESC LIMIT #{nb}")

    best_results.map{|result| [Position.find(result["id"]), result["gain"]]}
  end

  def self.worst_gains(nb=5)
    worst_results = Position.connection.select_all("SELECT (sell_price - buy_price) as gain, id from `positions` WHERE sell_price NOT NULL ORDER BY gain LIMIT #{nb}")

    worst_results.map{|result| [Position.find(result["id"]), result["gain"]]}
  end

  def gain
    if sell_price.nil? || buy_price.nil?
      0.0
    else
      (sell_price - buy_price) * 100 / buy_price
    end
  end
end
