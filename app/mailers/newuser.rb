class Newuser < ApplicationMailer
    def sendmail(user)
        @user = user
        @url  = root_url + 'users/confirm?userId=' + @user.id.to_s + '&timeCreated=' + @user.created_at.to_s
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')        
    end
end
