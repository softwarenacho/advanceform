class ContactsController < ApplicationController

	def advance_form
		@contact = Contact.new
		params["name"] = params["name"].force_encoding('iso-8859-1').encode('utf-8')
		if params[:id]
			@id = params[:id]
		else
		# 	# request = URI.parse("https://crm.zoho.com/crm/private/json/Leads/searchRecords?authtoken=#{ENV['ZOHO_TOKEN']}&scope=crmapi&criteria=(Email:#{params[:email]})")
		# 	# pp response = JSON.parse(Net::HTTP.get(request))

		# 	# @id = response["response"]["result"]["Leads"]["row"]["FL"][0]["content"]
			@id = false
		end
	end

	def static
		render 'update_zoho'
	end

  def update_zoho
    base_request = "https://crm.zoho.com/crm/private/json/Leads/updateRecords?authtoken=#{ENV['ZOHO_TOKEN']}&scope=crmapi&id=#{params[:contact][:zoho_id]}&xmlData="
    changes = ""
    params[:contact].each do |k,v|
      if v != "" && k != :zoho_id.to_s
        field = k.capitalize.dup
        field = "Profession Type" if k == "profession_type"
        changes += "<FL val='#{field}'>#{v}</FL>"
      end
     end
    base_xmldata = "<Leads><row no='1'>#{changes}</row></Leads>"
    request = URI.parse(URI.escape(base_request + base_xmldata))
    check = JSON.parse(Net::HTTP.get(request))
    @params = params[:contact]
  end

end
