ActiveAdmin.register User do
  permit_params :email, :user_name, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :user_name
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :user_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
