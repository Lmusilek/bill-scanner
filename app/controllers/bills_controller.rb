class BillsController < ApplicationController
  before_action :set_bill, only: %i[ show edit update destroy ]

  # GET /bills
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      redirect_to @bill, notice: "Bill was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @bill.update(bill_params)
      redirect_to @bill, notice: "Bill was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bills/1
  def destroy
    @bill.destroy
    redirect_to bills_url, notice: "Bill was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:name, :photo)
    end
end
