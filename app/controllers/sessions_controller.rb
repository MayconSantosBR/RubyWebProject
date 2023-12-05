class SessionsController < ApplicationController
  def new
    @form = UserLoginDto.new
    render :index
  end

  def register_form
    @form = UserDto.new
    render :register
  end

  def create
    model = UserLoginDto.new(create_params_login)
    user = User.find_by(email: model.email)

    if user.password_digest == model.password
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash.now[:alert] = 'Invalid email or password'
      redirect_to action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully!'
  end

  def register
    @user = UserDto.new(create_params)

    if @user.valid?
      @user_entity = User.new(email: @user.email, password_digest: @user.password)
      @user_entity.save
      redirect_to action: 'new'
    else
      flash.now[:alert] = 'Validation error. Please check the form.'
      render :register
    end
  end

  private

  def create_params
    params.require(:user_dto).permit(:email, :password, :confirm_password)
  end

  def create_params_login
    params.require(:user_login_dto).permit(:email, :password)
  end
end
