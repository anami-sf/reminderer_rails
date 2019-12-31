require 'twilio-ruby'

class NotificationsController < ApplicationController  
    
    skip_before_action :authorized, only: [ :notify ]
    skip_before_action :verify_authenticity_token
    # after_action :add_headers

    def notify
        @client = Twilio::REST::Client.new(
            Rails.application.credentials.twilio_acct_sid,
            Rails.application.credentials.twilio_auth_token
        )

        # Twilio.configure do |config|
        #     config.account_sid = acct_sid
        #     config.auth_token = auth_token
        # end
        
        message = @client.messages.create(
        from: '+14152134974',
        to: '+14153351196',
        body: 'This is my favorite twilio message',
        media_url: 'http://linode.rabasa.com/yoda.gif'
        )
        #render plain: message.status
    end

    # def add_headers
    #     #response.headers['test-controller-header'] = 'test-controller-header-value'
    #     response.headers['Access-Control-Allow-Origin'] = 'http://localhost:3001'
    # end

end
