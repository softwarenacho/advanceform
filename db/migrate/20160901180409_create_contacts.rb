class CreateContacts < ActiveRecord::Migration
  def change
    create_table "contacts" do |t|
	    t.string	 "zoho_id"
	    t.string   "knowledge"
	    t.string   "phone"
	    t.integer  "age"
	    t.string   "gender"
	    t.string   "activity"
	    t.string   "profession"
	    t.string   "profession_type"
	    t.string   "residence"
	    t.string   "availability"
	    t.string   "payment_method"
	  end
  end
end
