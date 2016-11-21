class ItemReviewsController < ApplicationController
  before_action :set_item_review, only: [:show, :edit, :update, :destroy]

  # GET /item_reviews
  # GET /item_reviews.json
  def index
    @item_reviews = ItemReview.all
  end

  # GET /item_reviews/1
  # GET /item_reviews/1.json
  def show
  end

  # GET /item_reviews/new
  def new
    @item_review = ItemReview.new
  end

  # GET /item_reviews/1/edit
  def edit
  end

  # POST /item_reviews
  # POST /item_reviews.json
  def create
    @item_review = ItemReview.new(item_review_params)

    respond_to do |format|
      if @item_review.save
        format.html { redirect_to @item_review, notice: 'Item review was successfully created.' }
        format.json { render :show, status: :created, location: @item_review }
      else
        format.html { render :new }
        format.json { render json: @item_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_reviews/1
  # PATCH/PUT /item_reviews/1.json
  def update
    respond_to do |format|
      if @item_review.update(item_review_params)
        format.html { redirect_to @item_review, notice: 'Item review was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_review }
      else
        format.html { render :edit }
        format.json { render json: @item_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_reviews/1
  # DELETE /item_reviews/1.json
  def destroy
    @item_review.destroy
    respond_to do |format|
      format.html { redirect_to item_reviews_url, notice: 'Item review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_review
      @item_review = ItemReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_review_params
      params.require(:item_review).permit(:item_id, :handlename, :comment)
    end
end
