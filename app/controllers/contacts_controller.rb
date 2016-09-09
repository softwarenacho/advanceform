class ContactsController < ApplicationController

	def advance_form
		p "Trying console print"
		@contact = Contact.new
		if params[:id]
			pp @id = params[:id]
		else
			# request = URI.parse("https://crm.zoho.com/crm/private/json/Leads/searchRecords?authtoken=#{ENV['ZOHO_TOKEN']}&scope=crmapi&criteria=(Email:#{params[:email]})")
			# pp response = JSON.parse(Net::HTTP.get(request))

			# @id = response["response"]["result"]["Leads"]["row"]["FL"][0]["content"]
			pp @id = false
		end
	end

  def update_zoho
    base_request = "https://crm.zoho.com/crm/private/json/Leads/updateRecords?authtoken=#{ENV['ZOHO_TOKEN']}&scope=crmapi&id=#{params[:contact][:zoho_id]}&xmlData="
    changes = ""
    phone = params[:contact][:phone]
    params[:contact][:phone] = (phone == nil || (phone.scan(/\d+/).join().size < 7) || (phone.scan(/\d+/).join().size > 16)) ? phone.scan(/\d+/).join() : ""
    params[:contact].each do |k,v|
      if v != "" && k != :zoho_id.to_s
        field = k.capitalize.dup
        field = "Profession Type" if k == "profession_type"
        changes += "<FL val='#{field}'>#{v}</FL>"
      end
     end
    base_xmldata = "<Leads><row no='1'>#{changes}</row></Leads>"
    p request = URI.parse(URI.escape(base_request + base_xmldata))
    p @check = JSON.parse(Net::HTTP.get(request))
  end

end
