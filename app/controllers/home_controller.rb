class HomeController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]
  def index
    @trails = Trail.all.limit(3)
  end
end
