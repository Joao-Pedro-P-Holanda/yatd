class PurchaseLinksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_purchase
  before_action :set_purchase_link, only: %i[ show edit toggle_complete update destroy ]
  before_action :set_og_info, only: %i[ show edit toggle_complete update destroy]

  # GET /purchase_links or /purchase_links.json
  def index
    @purchase_links = @purchase.purchase_links.all
  end

  # GET /purchase_links/1 or /purchase_links/1.json
  def show
  end

  # GET /purchase_links/new
  def new
    @purchase_link =  @purchase.purchase_links.build
  end

  # GET /purchase_links/1/edit
  def edit
  end

  # POST /purchase_links or /purchase_links.json
  def create
    @purchase_link = @purchase.purchase_links.build(purchase_link_params)

    respond_to do |format|
      if @purchase_link.save
        set_og_info()
        format.html { redirect_to purchase_purchase_links_path, notice: "Purchase link was successfully created." }
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.remove("modal"),
            turbo_stream.append("purchase_list", partial: "purchase_links/purchase_link", locals: { purchase_link: @purchase_link, og_info: @og_info, purchase: @purchase }),
            # running javascript when updating the page
            turbo_stream.append(:body, "<script>showNoItemFound()</script>".html_safe)
          ]
        }
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
        format.html { redirect_to purchase_path(@purchase), notice: "Purchase link was successfully updated." }
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.remove("modal"),
            turbo_stream.replace("purchase_link_#{@purchase_link.id}", partial: "purchase_links/purchase_link", locals: { purchase_link: @purchase_link, og_info: @og_info, purchase: @purchase })
            ]
        }
        format.json { render :show, status: :ok, location: @purchase_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_complete
    respond_to do |format|
      if @purchase_link.update(complete: !@purchase_link.complete)
        format.html { redirect_to purchase_path(@purchase), notice: "Purchase link was successfully updated." }
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

    Rails.logger.debug(@purchase)
    respond_to do |format|
      format.html { redirect_to purchase_path, status: :see_other, notice: "Purchase link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_purchase
      @purchase = current_user.purchases.find(params.expect(:purchase_id))
    end

    def set_og_info
      @og_info = helpers.get_url_info(@purchase_link.url)
    end

    def set_purchase_link
      @purchase_link = PurchaseLink.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def purchase_link_params
      params.expect(purchase_link: [ :complete, :url, :value ])
    end
end
