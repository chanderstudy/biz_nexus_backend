# app/admin/social_media_profiles.rb
ActiveAdmin.register SocialMediaProfile do
  menu parent: "Manage Business Card"
  permit_params :facebook, :youtube, :instagram, :linkedin, :other

  # Customize the index page
  index do
    selectable_column
    id_column
    column :facebook
    column :youtube
    column :instagram
    column :linkedin
    column :other
    actions
  end

  # Customize the form for creating/editing records
  form do |f|
    f.inputs 'Social Media Profile Details' do
      f.input :facebook
      f.input :youtube
      f.input :instagram
      f.input :linkedin
      f.input :other
    end
    f.actions
  end

  # Add filters if necessary
  filter :facebook
  filter :youtube
  filter :instagram
  filter :linkedin
  filter :other
end
