ActiveAdmin.register Listing do

 permit_params :address, :lat, :lng, :user_id, :beds, :baths, :half_baths, :description, :garage_spaces, :assigned_parking, :active, :age, :size, :city_id, :heat_gas, :heat_radiator, :ac_window_units, :ac_central, :list_date, :pin, :recent_rehab, :vintage, :new_construction, :price, :rental, :state, :st_num, :street, :st_suffix, :cp, :unit, :zip_code, :property_type, :laundry, :cats, :dogs, :available_date, :image_urls, :neighborhood_id, :picture_count, :mls_id, :lo_mlsid, :la_first_name, :la_last_name, :total_baths

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
