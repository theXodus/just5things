class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @item = @user.items.new # this has a bad code feel to me, but it was the only way I could get it to work
    @items = @user.items.all
  end
end
