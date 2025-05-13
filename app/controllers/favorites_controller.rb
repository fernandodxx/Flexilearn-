class FavoritesController < ApplicationController
  before_action :set_trail

  def create
    Current.user.favorites.create(trail: @trail)
    respond_to do |format|
      format.js   # create.js.erb
      format.html { redirect_to :trails, notice: "Adicionado aos favoritos." }
    end
  end

  def destroy
    Current.user.favorites.where(trail: @trail).destroy_all
    respond_to do |format|
      format.js  # destroy.js.erb
      format.html { redirect_to :trails, notice: "Removido dos favoritos." }
    end
  end

  private

  def set_trail
    @trail = Trail.find(params[:trail_id])
  end
end
