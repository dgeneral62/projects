# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    Newuser.sendmail(@user).deliver_now unless @user.invalid?
  end

  def update
    super
  end
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
  
end 