class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]
  before_action :set_clients, only: [:new, :edit, :create, :update]

  def index
    @computers = Computer.all
  end

  def show
  end

  def new
    @computer = Computer.new
  end

  def edit
  end

  def create
    @computer = Computer.new(computer_params)
    if @computer.save
      redirect_to @computer, notice: 'Computer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @computer.update(computer_params)
      redirect_to @computer, notice: 'Computer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @computer.destroy!
    redirect_to computers_path, status: :see_other
  end

  private

  def set_computer
    @computer = Computer.find(params[:id])
  end

  def set_clients
    @clients = Client.all
  end

  def computer_params
    params.require(:computer).permit(:hostname, :date, :endoflife, :assigned_to, :processor, :memory, :type_disk, :vpn, :local_password, :local_account, :client_id)
  end
end
