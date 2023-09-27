ActiveAdmin.register Job do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # 
  #
  # or
  #
  # permit_params do
  #   permitted = [:job_title, :description, :location, :salary, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :job_title, :description, :location, :salary, :user_id
 
  index do
    selectable_column
    id_column
    column :job_title
    column :description
    column :location
    column :salary
    column :user_id
    column :created_at
    actions
  end
  
  filter :job_title
  filter :salary
  filter :location
  filter :user, collection: User.all.map{|a| [a.user_name , a.id] } 

  form do |f|
    f.inputs do
      f.input :user, collection: User.all.map{|a| [a.user_name , a.id] }
      # f.input :user_id
      f.input :job_title
      f.input :description
      f.input :location
      f.input :salary
    end
    f.actions
  end
end
