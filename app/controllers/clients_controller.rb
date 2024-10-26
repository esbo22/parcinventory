class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :print_equipments]

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
    @computers = @client.computers
    render layout: 'print'
  end

  def autocomplete
    query = params[:term] # jQuery UI envoie 'term' comme paramètre pour l'autocomplétion
    clients = current_user.clients.where('name LIKE ?', "%#{query}%").limit(10)
    render json: clients.map { |client| { label: client.name, value: client.id } }
  end

  def print_equipments
    @client = Client.find(params[:id])
    @computers = @client.computers

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "equipments_#{@client.name}",
               page_size: params[:paper_size] || 'A4',
               orientation: params[:orientation] || 'landscape',  
               template: "clients/print_equipments",  # Ne pas préciser .html.erb, Rails va le chercher automatiquement
               layout: 'pdf'  # Si vous avez un layout spécifique pour le PDF
      end
    end
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
