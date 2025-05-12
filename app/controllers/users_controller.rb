class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = Current.user
  end

  def update
    if Current.user.update(user_params)
      redirect_to Current.user, notice: "Perfil atualizado com sucesso!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :twitter, :github, :avatar)
  end
end
