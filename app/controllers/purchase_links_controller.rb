class PurchaseLinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase_link, only: %i[ show edit update destroy ]

  # GET /purchase_links or /purchase_links.json
  def index
    @purchase_links = PurchaseLink.all
  end

  # GET /purchase_links/1 or /purchase_links/1.json
  def show
  end

  # GET /purchase_links/new
  def new
    @purchase_link = PurchaseLink.new
  end

  # GET /purchase_links/1/edit
  def edit
  end

  # POST /purchase_links or /purchase_links.json
  def create
    @purchase_link = PurchaseLink.new(purchase_link_params)

    respond_to do |format|
      if @purchase_link.save
        format.html { redirect_to @purchase_link, notice: "Purchase link was successfully created." }
        format.json { render :show, status: :created, location: @purchase_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_links/1 or /purchase_links/1.json
  def update
    respond_to do |format|
      if @purchase_link.update(purchase_link_params)
        format.html { redirect_to @purchase_link, notice: "Purchase link was successfully updated." }
        format.json { render :show, status: :ok, location: @purchase_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_links/1 or /purchase_links/1.json
  def destroy
    @purchase_link.destroy!

    respond_to do |format|
      format.html { redirect_to purchase_links_path, status: :see_other, notice: "Purchase link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_link
      @purchase_link = PurchaseLink.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def purchase_link_params
      params.expect(purchase_link: [ :complete, :url ])
    end
end
