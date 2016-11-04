class ComparisonsController < ApplicationController
  before_action :set_comparison, only: [:show, :edit, :update, :destroy]

  # GET /comparisons
  # GET /comparisons.json
  def index
    @comparisons = Comparison.all
  end

  # GET /comparisons/1
  # GET /comparisons/1.json
  def show
  end

  # GET /comparisons/new
  def new
    @comparison = Comparison.new
  end

  # GET /comparisons/1/edit
  def edit
  end

  # POST /comparisons
  # POST /comparisons.json
  def create
    @comparison = Comparison.new(comparison_params)

    respond_to do |format|
      if @comparison.save
        format.html { redirect_to @comparison, notice: 'Comparison was successfully created.' }
        format.json { render :show, status: :created, location: @comparison }
      else
        format.html { render :new }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comparisons/1
  # PATCH/PUT /comparisons/1.json
  def update
    respond_to do |format|
      if @comparison.update(comparison_params)
        format.html { redirect_to @comparison, notice: 'Comparison was successfully updated.' }
        format.json { render :show, status: :ok, location: @comparison }
      else
        format.html { render :edit }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comparisons/1
  # DELETE /comparisons/1.json
  def destroy
    @comparison.destroy
    respond_to do |format|
      format.html { redirect_to comparisons_url, notice: 'Comparison was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comparison
      @comparison = Comparison.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comparison_params
      params.require(:comparison).permit(:category, :item, :user, :comparison, :point_type, :point1, :comment1, :point2, :comment2, :point3, :comment3, :good)
    end
end
