class EuroFund < ActiveRecord::Base
  attr_accessible :name

  has_many :positions, :as => :support
end
