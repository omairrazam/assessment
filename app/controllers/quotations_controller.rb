class QuotationsController < ApplicationController
  before_action :set_quotation, only: %i[ show edit update destroy ]

  # GET /quotations or /quotations.json
  def index
    @quotations = Quotation.all
  end

  # GET /quotations/1 or /quotations/1.json
  def show
  end

  # GET /quotations/new
  def new
    create_types
    @quotation = Quotation.new
  end

  # GET /quotations/1/edit
  def edit
    @property_transaction = @quotation.property_transaction

    if @property_transaction.blank?
      @property_transaction = PropertyTransaction.new
      @property_transaction.build_property
      @property_transaction.build_insurance
      @property_transaction.first_homeowner_name = @quotation.full_name
      @property_transaction.property.address = @quotation.address
      @property_transaction.property.city = @quotation.city
      @property_transaction.property.postal_code = @quotation.postal_code
    end
  end

  # POST /quotations or /quotations.json
  def create
    @quotation = Quotation.new(quotation_params)

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to edit_quotation_url(@quotation), notice: "Quotation was successfully created." }
        format.json { render :show, status: :created, location: @quotation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1 or /quotations/1.json
  def update
    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to edit_quotation_url(@quotation), notice: "Quotation was successfully updated." }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1 or /quotations/1.json
  def destroy
    @quotation.destroy

    respond_to do |format|
      format.html { redirect_to quotations_url, notice: "Quotation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quotation_params
      params.require(:quotation).permit(
        :first_name, :last_name, :email, :phone, :municipal_evaluation, :address, :postal_code, :city, 
        :referral_agent_email, :province
      )
    end

    def create_types
      if PropertyType.count == 0
        PropertyType.upsert_all(
          [
            'Single-family Dwelling', 'Condominium', 
            'Undivided co-ownership', 'Duplex', 
            'Triplex', 'Quadruplex', '5 Logis', 
            '6 Logis', 'Vacant Property'
          ].map do |name|
              {name: name}
          end
        )
      end
    end
end
