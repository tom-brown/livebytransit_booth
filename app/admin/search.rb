ActiveAdmin.register Search do

 permit_params :user_id, :property_type, :beds, :baths, :max_price, :rental, :cats, :dogs, :cta_distance, :metra_distance, :parking, :laundry, :name, :min_price, :old_mlsids, :current_mlsids, :new_mlsids

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
