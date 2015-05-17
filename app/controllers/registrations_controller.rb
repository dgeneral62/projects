# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    googleId = params[:googleId]
    if (googleId != nil && googleId != "")
      users = User.where(google :googleId)
      if users.count == 0
        @user.google = googleId
        @user.save
      end
    end
    Newuser.sendmail(@user).deliver_now unless @user.invalid?
  end

  def update
    super
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :googleId, :bio)
  end
  
end 