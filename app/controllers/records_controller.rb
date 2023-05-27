class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: %i[show edit update destroy]

  def index
    @records = Record.where(user_id: current_user.id)
    total_amount = 0
    @records.each do |record|
      if record.category.is_income
        total_amount += record.amount
      else
        total_amount -= record.amount
      end
    end
    @counter = total_amount
  end

  def show; end

  def new
    @record = Record.new
  end

  def new_record
    @id = params[:id]
    @record = Record.new
  end

  def edit; end

  def create
    @record = Record.new(record_params)
    @record.user = current_user
    respond_to do |format|
      if @record.save
        format.html { redirect_to record_path(@record), notice: 'Registro creada' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new_record, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @record.update(record_params)
          format.html { redirect_to record_url(@record), notice: "Registro creada" }
          format.json { render :show, status: :created, location: @record }
      else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record.destroy

    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Registro eliminada' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_record
    @record = Record.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def record_params
    params.require(:record).permit(:title, :amount, :date, :user_id, :category_id)
  end
end
