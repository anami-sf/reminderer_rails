class User < ApplicationRecord
    
    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |user|
          user.name = auth.info.name
          user.email = auth.info.email
        end
      end

      def self.create_user_for_google(data)                  
        where(uid: data["email"]).first_or_initialize.tap do |user|
          user.provider="google_oauth2"
          user.uid=data["email"]
          user.email=data["email"]
          user.password=Devise.friendly_token[0,20]
          user.password_confirmation=user.password
          user.save!
        end
      end  
end
