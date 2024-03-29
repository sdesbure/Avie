class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => I18n.t('administrator_only')
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    authorize! :show, @user
    @active = !request.url.include?("show_all_positions")
  end

end
