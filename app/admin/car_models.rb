ActiveAdmin.register CarModel do
  permit_params :title
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :brand_id, :car_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :brand_id, :car_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
