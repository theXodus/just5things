class UsersController < ApplicationController
  before_action :check_if_friends, only: :show
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @item = Item.new
    @items = @user.items.all
  end

  private

  def friends
    @user = User.find(params[:id])
    @user.friends.include?(current_user) || current_user == @user
  end

  def check_if_friends
    unless friends
      redirect_to :back
      flash[:notice] = "Sorry, you must be friends to view this profile"
    end
  end
end
