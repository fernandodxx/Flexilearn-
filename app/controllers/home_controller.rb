class HomeController < ApplicationController
  def index
    @trails = Trail.all.limit(3)
  end
end
