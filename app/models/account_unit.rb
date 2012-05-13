class AccountUnit < ActiveRecord::Base
  attr_accessible :code, :morningstar_url, :name
  has_many :positions, :as => :support
end
