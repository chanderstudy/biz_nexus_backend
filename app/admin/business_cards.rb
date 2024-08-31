# app/admin/business_cards.rb
ActiveAdmin.register BusinessCard do
  menu parent: "Manage Business Card"
  permit_params :name, :owner_name, :email, :address, :landmark, :mobile, :latitude, :longitude,
                :bcard_type, :bcard_power, :business_category_id, :business_sub_category_id,
                :pstatus, :status, :seo_active, :business_seo_profile_id, :social_media_profile_id,
                :website, :bank_account, :bank_ifsc, :bank_type, :qrcode_active, :qrcode_file,
                :state_id, :district_id, :city_id, :area_id

  # Customize the index page
  index do
    selectable_column
    id_column
    column :name
    column :owner_name
    column :email
    column :address
    column :landmark
    column :mobile
    column :latitude
    column :longitude
    column :bcard_type
    column :bcard_power
    column :business_category
    column :business_sub_category
    column :pstatus
    column :status
    column :seo_active
    column :business_seo_profile
    column :social_media_profile
    column :website
    column :bank_account
    column :bank_ifsc
    column :bank_type
    column :qrcode_active
    column :qrcode_file
    column :state
    column :district
    column :city
    column :area
    actions
  end

  # Customize the form for creating/editing records
  form do |f|
    f.inputs 'Business Card Details' do
      f.input :name
      f.input :owner_name
      f.input :email
      f.input :address
      f.input :landmark
      f.input :mobile
      f.input :latitude
      f.input :longitude
      f.input :bcard_type
      f.input :bcard_power
      f.input :business_category
      f.input :business_sub_category
      f.input :pstatus
      f.input :status
      f.input :seo_active
      f.input :business_seo_profile
      f.input :social_media_profile
      f.input :website
      f.input :bank_account
      f.input :bank_ifsc
      f.input :bank_type
      f.input :qrcode_active
      f.input :qrcode_file
      f.input :state
      f.input :district
      f.input :city
      f.input :area
    end
    f.actions
  end

  # Add filters if necessary
  filter :name
  filter :owner_name
  filter :email
  filter :address
  filter :landmark
  filter :mobile
  filter :latitude
  filter :longitude
  filter :bcard_type
  filter :bcard_power
  filter :business_category
  filter :business_sub_category
  filter :pstatus
  filter :status
  filter :seo_active
  filter :business_seo_profile
  filter :social_media_profile
  filter :website
  filter :bank_account
  filter :bank_ifsc
  filter :bank_type
  filter :qrcode_active
  filter :qrcode_file
  filter :state
  filter :district
  filter :city
  filter :area
end
