class ContactsController < ApplicationController

	def advance_form
		@contact = Contact.new
		params[:phone] = params[:Phone] if params[:Phone]
		if params[:id]
			@id = params[:id]
		else
			p request = URI.parse("https://crm.zoho.com/crm/private/json/Leads/searchRecords?authtoken=#{ENV['ZOHO_TOKEN']}&scope=crmapi&criteria=(Email:#{params[:Email]})")
			p "*" *50
			pp response = JSON.parse(Net::HTTP.get(request))
			if response["response"]["message"] == "There is no data to show"
				base_request = "https://crm.zoho.com/crm/private/xml/Leads/insertRecords?newFormat=1&authtoken=#{ENV['ZOHO_TOKEN']}&scope=crmapi&xmlData="
				base_xmldata = "<Leads><row no='1'>#{changes}</row></Leads>"
			p "*" *50
			pp @id = @id["response"]["result"]["Leads"]["row"]["FL"][0]["content"]
		end
	end

  def update_zoho
    base_request = "https://crm.zoho.com/crm/private/json/Leads/updateRecords?authtoken=#{ENV['ZOHO_TOKEN']}&scope=crmapi&id=#{params[:contact][:zoho_id]}&xmlData="
    changes = ""
    p "Estos son los params de update zoho"
    p params[:contact][:phone]
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
    p request = URI.parse(base_request + base_xmldata)
    p 		@check = JSON.parse(Net::HTTP.get(request))
  end

end
