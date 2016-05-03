class ItemsController < ApplicationController

  def new
    @item = @user.items.new
  end

  def create
    @user = current_user
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:success] = "Item Created"
      redirect_to current_user
    else
      flash[:danger] = "Error Saving Item"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
