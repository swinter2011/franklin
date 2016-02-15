class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update, :show]
before_action :correct_user, only: [:edit, :update, :show]
before_filter :init_virtues

  def init_virtues
    virtues = ['Temperance', 'Silence', 'Order', 'Resolution', 'Frugality', 'Industry',
               'Sincerity', 'Justice', 'Moderation', 'Cleanliness', 'Tranquility', 'Chastity','Humility']
    @virtue =  virtues[Week.count % 12]
  end

  def show
    @user = User.find(params[:id])
    @week = Week.new
    @weeks = @user.weeks.paginate(page: params[:page], per_page: 13)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Franklin! Franklin allows you to focus on practicing one virtue each week. You can enter the number of times that you failed to practice that virtue in the fields below. Franklin will store that information in the fields below until you commit it to the record books by clicking 'Submit'. Click 'Account' and 'Profile' to check out your results."

      redirect_to new_week_path
    else
      render 'new'
    end
  end 

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    flash[:success]="Profile updated!"
    redirect_to @user

    else
    render 'edit'
    end
  end

  private

    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
	store_location
	flash[:danger] = "Please log in."
	redirect_to login_url
      end
    end

    def correct_user
      @user=User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
