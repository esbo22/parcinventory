class ComputersController < ApplicationController

  def index
    @computers = Computer.all
  end

  def show
    @computer = Computer.find(params[:id])
  end

  def new
    @computer = Computer.new
  end

  def edit
    @computer = Computer.find(params[:id])
  end

  def create
    @computer = Computer.new(computer_params)
    if @computer.save
      redirect_to @computer
    else
      Rails.logger.debug "Errors: #{@computer.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @computer = Computer.find(params[:id])
    if @computer.update(computer_params)
      redirect_to @computer
    else
      Rails.logger.debug "Errors: #{@computer.errors.full_messages}"
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @computer = Computer.find(params[:id])
    @computer.destroy!
    redirect_to root_path, status: :see_other
  end

  private
    def computer_params
      params.require(:computer).permit(:hostname, :date, :endoflife, :assigned_to, :processor, :memory, :type_disk, :vpn, :local_password, :local_account, :id)
    end
end
