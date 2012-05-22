class HomeController < ApplicationController
  def index
    @best_insurers = Insurer.best_insurers(5)
    @best_brokers = Broker.best_brokers(5)
    @best_gains = Position.best_gains(5)
    @worst_gains = Position.worst_gains(5)
  end
end
