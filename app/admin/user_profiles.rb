ActiveAdmin.register UserProfile do
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:f_name, :l_name, :skills, :experience, :education, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :f_name, :l_name, :skills, :experience, :education, :user_id, :image
 
  index do
    selectable_column
    id_column
    column :f_name
    column :l_name
    column :skills
    column :experience
    column :education
    column :user_id
    column :image do |img|
      image_tag img.image.url, size: "30x30"
    end
    actions
  end
  filter :f_name
  filter :skills
  filter :education
  filter :experience



  form do |f|
    f.inputs do
      f.input :f_name
      f.input :l_name
      f.input :skills
      f.input :experience 
      f.input :education
      f.input :user_id 
      f.input :image ,as: :file 
    end
    f.actions
  end

  show do
    attributes_table do
      row :f_name
      row :l_name
      row :skills
      row :education
      row :user_id

      row :image do |img|
        image_tag img.image.url
      end
    end
  end
end
