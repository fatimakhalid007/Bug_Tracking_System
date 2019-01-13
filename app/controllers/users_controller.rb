class UsersController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]
	def new
		@user=User.new
	end
	def index
		@user=User.all
	end
	def create
    @user = User.new(user_params)
    if @user.save
    	login(params[:user][:email], params[:user][:password])
    	flash[:success] = 'Welcome!'
      redirect_to root_path, :notice => "Signed up!"

    else
      render 'new'
    end
  end
    def edit
    @user = User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    if @user.update_attributes(user_params)
      if @user.update_attributes(user_params)
      	flash[:success] = "Profile updated"
      	redirect_to @user
    	else
    		flash.now[:warning] = 'Enter correct information.'
      	render 'edit'
    	end
  	end
	end
	  def show
   @user = User.find(params[:id])
  end
  def developers
  	@user=User.where(user_type:'Developer')
  end
  def quas
  	@user=User.where(user_type:'Quality Assurance')
  end
  helper_method:developers
  helper_method:quas
 private
		def user_params
      params.require(:user).permit(:email,:password,:password_confirmation,:name,:user_type,:image)
    end
  def not_authenticated
    redirect_to signin_path, :alert => "First log in to view this page."
  end

end
