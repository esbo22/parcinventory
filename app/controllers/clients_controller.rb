class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = current_user.clients
    if params[:search].present?
      @clients = @clients.where('name LIKE ?', "%#{params[:search]}%")
    end
  end

  def show
    @computers = @client.computers
  end

  def new
    @client = Client.new
  end

  def edit
    # @client est déjà défini par `set_client`
  end

  def create
    @client = current_user.clients.build(client_params)
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

  def print_equipments
    @client = current_user.clients.find(params[:id])
    @computers = @client.computers
    render layout: 'print'
  end

  def autocomplete
    query = params[:query]
    clients = current_user.clients.where('name LIKE ?', "%#{query}%")
    render json: clients.pluck(:id, :name)
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
