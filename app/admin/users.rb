ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_name, :password_digest, :email, :type, :reset_password_token, :reset_password_sent_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :user_name, :password, :password_confirmation, :email, :type, :reset_password_token, :reset_password_sent_at

  index do
    selectable_column
    id_column
    column :user_name
    column :email
    column :encrypted_password
    column :type
    actions
  end
  
  filter :user_name
  filter :email
  filter :type

  form do |f|
    f.inputs do
      f.input :user_name
      f.input :email
      f.input :type
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  
  
end
