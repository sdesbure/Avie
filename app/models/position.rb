class Position < ActiveRecord::Base
  belongs_to :user
  belongs_to :support, :polymorphic => true
  attr_accessible :buy_date, :buy_price, :sell_date, :sell_price, :price_paid 
end
