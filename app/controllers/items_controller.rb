class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # 商品名、コンビニ名による表示
  # FIXME 商品一覧画面がDBに対応するまでのメソッド
  def view
    shop = params[:shop]
    name = params[:name]
    @item = Item.where(shop:shop).where(name:name) 
    if !@item.blank?
      @item = @item.first
      puts @item
    else
      # DBで見つからない場合、静的情報にないか確認する
      # FIXME 商品一覧移行完了までの暫定ロジック)
      item_hash = self.get_product_hash 
      item_hash.each_value {|item_list|
         item_list.each{|product| 
           if !@item.blank? 
             break
           end 
           if product.name==name && product.shop==shop
             @item = Item.new
             @item.shop=product.shop
             @item.name=product.name
             @item.category=product.category
             @item.price=product.price
             @item.item=product.item
             @item.good=0
             @item.bad=0
             @item.save
           end
         }
      }
    end
  end

  def vote
    id = params[:item][:id]
    @item = Item.find(id)
    if params[:good] 
      @item.good = @item.good+1
    else
      @item.bad = @item.bad+1
    end
    respond_to do |format|
      if @item.update(good:@item.good,bad:@item.bad)
        format.html { redirect_to @item , notice: '貴方の評価を投稿しました!' }
      else
        format.html { redirect_to @item , error: '投稿に失敗しました' } 
      end
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:shop, :category, :item, :name, :price, :good, :bad, :image)
    end
end
