class PropertyTransactionsController < ApplicationController
  before_action :set_property_transaction, only: %i[ show edit update destroy ]

  # GET /property_transactions or /property_transactions.json
  def index
    @property_transactions = PropertyTransaction.all
  end

  # GET /property_transactions/1 or /property_transactions/1.json
  def show
  end

  # GET /property_transactions/new
  def new
    @property_transaction = PropertyTransaction.new
  end

  # GET /property_transactions/1/edit
  def edit
  end

  # POST /property_transactions or /property_transactions.json
  def create
    @property_transaction = PropertyTransaction.new(property_transaction_params)

    respond_to do |format|
      if @property_transaction.save!
        format.html { redirect_to new_quotation_url, notice: "Property transaction was successfully created." }
        format.json { render :show, status: :created, location: @property_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_transactions/1 or /property_transactions/1.json
  def update
    respond_to do |format|
      if @property_transaction.update(property_transaction_params)
        format.html { redirect_to new_quotation_url, notice: "Property transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @property_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_transactions/1 or /property_transactions/1.json
  def destroy
    @property_transaction.destroy

    respond_to do |format|
      format.html { redirect_to property_transactions_url, notice: "Property transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_transaction
      @property_transaction = PropertyTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_transaction_params
      params.require(:property_transaction).permit(
        :language, 
        :first_homeowner_name, 
        :second_homeowner_name, 
        :third_homeowner_name, 
        :is_owner,
        :purshase_date, 
        :property_value, 
        :property_type_id, 
        :quotation_id,
        :request_a_callback_phone,
        :request_a_callback_best_moment,
        property_attributes: [
          :id, :lot_number, :address, 
          :city, :postal_code, :on_municipal_water_sewer, :title_insurance_issued, :title_insurance_denied,
          :bound_by_water, :_destroy
        ],
        insurance_attributes: [
          :id, :notes, :referral_agent_name, :referral_agent_email, :_destroy
        ]
      )
    end
end
