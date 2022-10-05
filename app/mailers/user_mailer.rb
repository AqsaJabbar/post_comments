class UserMailer < ApplicationMailer
    default from: 'admin@test.com'
    def welcome_email 
        @user=params[:user]
        mail(to: @user.email,
             subject: 'Welcome' )
    end
end
