class WelcomeController < ApplicationController

  def index
    @item = params[:item]
    if(@item.nil? || @item == "") 
      @item = "惣菜"
    end

    @product = Item.where(category: @item)

  end
end

