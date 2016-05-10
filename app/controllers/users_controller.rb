class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @item = Item.new
    @items = @user.items.all
  end
end
