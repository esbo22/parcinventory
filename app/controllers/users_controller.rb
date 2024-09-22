class UsersController < ApplicationController
  before_action :authenticate_user!  # Assure-toi que l'utilisateur est connecté

  def show
    @user = current_user  # Récupère l'utilisateur connecté
  end
end