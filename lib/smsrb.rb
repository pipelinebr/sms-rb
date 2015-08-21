require "smsrb/version"

module Smsrb

	class Sms
		@account = ""
		@password = ""
		@base_url = ""

		def self.config(options = {})
			@account = options[:account]
			@password = options[:password]
		end

		def self.send(message_options)

		end

	end

	class Zenvia < Sms
		@base_url = "https://api-rest.zenvia360.com.br/services"

		def self.send(message_options)
			message_payload = payload_from_options(message_options)
			response = RestClient::Request.new(
		    method: :post,
		    url: "#{@base_url}/sendsms",
		    headers: { accept: :json,
		    content_type: :json,
		    Authorization:  basic_auth}
		  ).execute
		  results = JSON.parse(response.to_str)
		  results
		end

		def self.basic_auth
			Base64.strict_encode64("#{@account}:#{@password}")
		end

		def self.payload_from_options(message_options)
			payload = {sendSmsRequest: {}}
			payload[:sendSmsRequest][:from] = message_options[:from]
			payload[:sendSmsRequest][:to] = message_options[:to]
			payload[:sendSmsRequest][:msg] = message_options[:message]
			payload
		end
	
	end

  # Your code goes here...
end
