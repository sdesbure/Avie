class Position < ActiveRecord::Base
  belongs_to :user
  belongs_to :support, :polymorphic => true
  belongs_to :life_insurance_contract
  attr_accessible :buy_date, :buy_price, :sell_date, :sell_price, :price_paid 
  scope :active, where(:sell_date => nil)

  SUPPORTS_WHITE_LIST=[:euro_fund, :account_unit]

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
