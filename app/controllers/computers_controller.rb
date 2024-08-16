class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:new, :create, :edit, :update]
  before_action :set_clients, only: [:new, :edit]

  def index
    @computers = @client.computers
  end

  def show
  end

  def new
    @computer = @client.computers.build
  end

  def edit
    @client = @computer.client
  end

  def create
    @computer = @client.computers.build(computer_params)
    if @computer.save
      redirect_to client_path(@client), notice: 'Computer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @computer.update(computer_params)
      redirect_to client_path(@client), notice: 'Computer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @computer.destroy
    redirect_to client_path(@client), status: :see_other
  end

  private

  def set_computer
    @computer = Computer.find(params[:id])
  end

  def set_client
    @client = Client.find(params[:client_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Client non trouvé."
    redirect_to clients_path
  end

  def set_clients
    @clients = Client.all
  end

  def computer_params
    params.require(:computer).permit(:hostname, :date, :endoflife, :assigned_to, :processor, :memory, :type_disk, :vpn, :local_password, :local_account, :client_id)
  end
end
