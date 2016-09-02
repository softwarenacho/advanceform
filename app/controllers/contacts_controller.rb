class ContactsController < ApplicationController

	def advance_form
		@contact = Contact.new
		@id = params[:id]
	end

	def update_zoho
		p token = ENV['ZOHO_TOKEN']
		base_request = "https://crm.zoho.com/crm/private/json/Leads/updateRecords?authtoken=#{token}&scope=crmapi&id=#{params[:contact][:zoho_id]}&xmlData="
		changes = ""
		phone = params[:contact][:phone]
		params[:contact][:phone] = (phone == nil || (phone.scan(/\d+/).join().size < 7) || (phone.scan(/\d+/).join().size > 16)) ? phone.scan(/\d+/).join() : ""
		params[:contact].each do |k,v|
			if v != "" && k != :zoho_id.to_s
				field = k.capitalize.dup
				field = "Profesion Type" if k == "profesion_type"
				changes += "<FL val='#{field}'>#{v}</FL>"
			end
		end
		base_xmldata = "<Leads><row no='1'>#{changes}</row></Leads>"
		request = URI.parse(base_request + base_xmldata)
		@check = JSON.parse(Net::HTTP.get(request))
	end

end
