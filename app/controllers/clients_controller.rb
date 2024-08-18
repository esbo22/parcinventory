class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = current_user.clients # Récupère tous les clients de l'utilisateur connecté
  end

  def show
    @computers = @client.computers # Récupère tous les ordinateurs associés à ce client
  end

  def new
    @client = Client.new
    @clients = current_user.clients # Ajoutez cette ligne pour définir @clients
  end

  def edit
     @client = current_user.clients.find(params[:id])
  end

  def create
    @client = current_user.clients.build(client_params) # Associe le nouveau client à l'utilisateur connecté
    if @client.save
      redirect_to @client, notice: 'Client créé avec succès.'
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, status: :see_other
  end

  private

  def set_client
    @client = current_user.clients.find_by(id: params[:id])
    unless @client
      flash[:alert] = "Client non trouvé ou non autorisé."
      redirect_to clients_path
    end
  end

  def client_params
    params.require(:client).permit(:name, :address, :phone, :location)
  end
end
