class WelcomeController < ApplicationController

  def index
    @item = params[:item]
    if(@item.nil? || @item == "") 
      @item = "惣菜"
    end

    @product = (self.get_product_hash)[@item]
  end
end

