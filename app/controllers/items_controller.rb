class ItemsController < ApplicationController

  def new
    @item = @user.items.new
  end

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(item_params)

    if @item.save
      flash[:success] = "Item Created"
      redirect_to current_user
    else
      flash[:danger] = "Error Saving Item"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash.now[:success] = "ToDo Completed!"
    else
      flash[:alert] = "ToDo couldn't be deleted. Try again."
    end

    respond_to do |format|
       format.html
       format.js
     end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
