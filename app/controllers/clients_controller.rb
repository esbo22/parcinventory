class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :set_computers, only: [:new, :edit, :create, :update, :destroy]

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
    @clients = Client.all
  end

  def edit
    @clients = Client.all
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
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
    @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Client non trouvé."
    redirect_to clients_path
  end

  def set_computers
    @computers = Computer.all
  end

  def client_params
    params.require(:client).permit(:name, :address, :phone, :location)
  end
end
