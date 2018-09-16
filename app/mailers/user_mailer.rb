class UserMailer < ApplicationMailer
    def answer_notify(user)
        @user = user
        @greeting = "Some scrooge thinks they answered your question!"
        mail(to: @user, from: 'noreply@questionbox.com', subject: 'Someone Answered Your Question')
      end
end
