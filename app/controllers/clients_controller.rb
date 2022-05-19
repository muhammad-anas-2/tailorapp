class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @clients = Client.all
    @clients = Client.order(params[:sort])
    # @clients = Client.paginate(:page => params[:page], :per_page => 1).order('created_at DESC')
    # if params[:search]
    #    @clients = Client.all.find{|client| client.serial_no.include?(params[:search])}
    #     redirect_to client_path(@clients)
    #
    # else
    #   @clients = Client.all
    #   end


  end


  # GET /articles/1 or /articles/1.json
  def show

  end

  # GET /articles/new
  def new
    @clients = Client.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @clients = Client.new(client_params)

    respond_to do |format|
      if @clients.save
        format.html { redirect_to @clients, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @clients }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clients.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice:  "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_params
    params.require(:client).permit( :name, :serial_no, :phone, :type_name, :arm, :shoulder, :arm_hole,
                                   :neck_line, :chest, :waist, :skirt, :shalwar, :paincha, :description, :front,
                                    :side, :hip, :collar_ban, :cuff, :plate)
  end
end