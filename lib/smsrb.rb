require "smsrb/version"
require "rest-client"
require "base64"

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
			basic_auth_str = "Basic #{basic_auth}"
			url = "#{@base_url}/send-sms"
			response = RestClient.post url, message_payload.to_json, {accept: "application/json", content_type: "application/json", :Authorization => basic_auth_str}
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
			payload[:sendSmsRequest][:msg] = message_options[:msg]
			payload
		end
	
	end

  # Your code goes here...
end
