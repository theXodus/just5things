class ItemsController < ApplicationController

  before_action

  def new
    @item = @user.items.new
  end

  def create
    #@user = current_user
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:success] = "Item Created"
      redirect_to current_user
    else
      flash[:danger] = "Error Saving Item"
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])

    if @item.user == current_user
      @item.destroy
      flash.now[:success] = "ToDo Completed!"
    else
      flash[:alert] = "ToDo couldn't be deleted. Try again."
      redirect_to @user
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
