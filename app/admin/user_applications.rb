ActiveAdmin.register UserApplication do
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:job_id, :user_id, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :job_id, :user_id, :status, :resume
  
  index do
    selectable_column
    id_column
    column :status
    column :job_id
    column :user_id
    column :resume
    column :created_at
    column :updated_at
    actions
  end
  
  filter :status
  
  form do |f|
    f.inputs do
      f.input :job_id
      f.input :user_id
      f.input :status

      f.input :resume ,as: :file 
    end
    f.actions
  end
  
  show do
    attributes_table do
      row :status
      row :job_id
      row :user_id
      row :created_at
      row :updated_at

      row :resume do |ad|
        image_tag url_for(ad.resume)
      end
    end
  end
end
