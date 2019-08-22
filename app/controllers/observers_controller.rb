class ObserversController < ApplicationController

  def index
    @observers = Observer.all
  end
end
