require 'smsrb'

class SimpleSmsZenvia

	def self.send
		Smsrb::Zenvia.config({account: "SUA_CONTA", password: "SUA_SENHA"})
		msg_body = {}
		msg_body[:from] = "teste"
		msg_body[:to] = "TELEFONE_COM_DDI_E_DDD"
		msg_body[:msg] = "testando gem"
		Smsrb::Zenvia.send(msg_body)
	end

end

SimpleSmsZenvia.send