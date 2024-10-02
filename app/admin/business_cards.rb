ActiveAdmin.register BusinessCard do
  menu parent: "Manage Business Card"
  
  permit_params :name, :owner_name, :email, :address, :landmark, :mobile, 
                :latitude, :longitude, :bcard_type, :bcard_power, :business_sub_category_id, 
                :status, :seo_active, :website, :bank_account, 
                :bank_ifsc, :bank_type, :qrcode_active, :qrcode_file, 
                :state_id, :district_id, :city_id, :area_id, :portal_id,
                :description, :owner_designation, :work_phone_number, 
                :established_date, :created_by, :managed_by, :short_url, 
                :published, :promotion_type, :plan_id, :qr_publish, 
                :bank_name, :legal_publish, :business_pan_card, 
                :gst_number, :service_publish, :catalog_publish, 
                :social_media_publish, :photo_gallery_publish, 
                :video_gallery_publish, :feedback_publish, 
                :enquiry_publish, :external_portal_publish, :achivement,
                business_seo_profile_attributes: [:id, :seo_title, :_destroy],
                social_media_profile_attributes: [:id, :profile_name, :_destroy],
                faqs_attributes: [:id, :question, :answer, :_destroy],
                documents_attributes: [:id, :title, :document_type, :status, :file, :_destroy]

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
    column :business_sub_category
    column :status
    column :seo_active
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
    column :published
    column :established_date
    column :owner_designation
    column :work_phone_number
    column :short_url
    column :promotion_type
    column :plan_id
    column :qr_publish
    column :bank_name
    column :legal_publish
    column :business_pan_card
    column :gst_number
    column :service_publish
    column :catalog_publish
    column :social_media_publish
    column :photo_gallery_publish
    column :video_gallery_publish
    column :feedback_publish
    column :enquiry_publish
    column :external_portal_publish
    actions
  end

  form do |f|
    f.object.build_business_seo_profile if f.object.new_record?
    f.object.build_social_media_profile if f.object.new_record?
    
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
      f.input :business_sub_category
      f.input :status
      f.input :seo_active
      f.input :website
      f.input :bank_account
      f.input :bank_ifsc
      f.input :bank_type
      f.input :qrcode_active
      f.input :qrcode_file
      f.input :state, as: :searchable_select, fields: [:state_name], display_name: 'state_name'
      f.input :district, as: :searchable_select, fields: [:dist_name], display_name: 'dist_name'
      f.input :city, as: :searchable_select, fields: [:city_name], display_name: 'city_name'
      f.input :area, as: :searchable_select, fields: [:area_name], display_name: 'area_name'
      f.input :portal, as: :searchable_select, fields: [:portal_name], display_name: 'portal_name'
      f.input :description
      f.input :owner_designation
      f.input :work_phone_number
      f.input :established_date
      f.input :short_url
      f.input :published
      f.input :promotion_type
      f.input :plan_id
      f.input :qr_publish
      f.input :bank_name
      f.input :legal_publish
      f.input :business_pan_card
      f.input :gst_number
      f.input :service_publish
      f.input :catalog_publish
      f.input :social_media_publish
      f.input :photo_gallery_publish
      f.input :video_gallery_publish
      f.input :feedback_publish
      f.input :enquiry_publish
      f.input :external_portal_publish
      f.input :achivement
    end

    f.inputs 'SEO Profile' do
      f.semantic_fields_for :business_seo_profile do |bsp|
        bsp.input :active
        bsp.input :keywords
        bsp.input :meta_tag
        bsp.input :description
        bsp.input :_destroy, as: :boolean, label: 'Delete this SEO Profile?'
      end
    end

    # Social Media Profile
    f.inputs 'Social Media Profile' do
      f.semantic_fields_for :social_media_profile do |smp|
        smp.input :facebook
        smp.input :youtube
        smp.input :instagram
        smp.input :linkedin
        smp.input :other
        smp.input :_destroy, as: :boolean, label: 'Delete this Social Media Profile?'
      end
    end

    f.has_many :faqs, heading: 'FAQs', allow_destroy: true, new_record: true do |faq|
      faq.input :question
      faq.input :answer
      faq.input :_destroy, as: :boolean, label: 'Delete this FAQ?'
    end

    # Documents
    f.has_many :documents, heading: 'Documents', allow_destroy: true, new_record: true do |doc|
      doc.input :title
      doc.input :document_type
      doc.input :status
      doc.input :file, as: :file
      doc.input :_destroy, as: :boolean, label: 'Delete this Document?'
    end

    f.actions
  end

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
  filter :business_sub_category
  filter :status
  filter :seo_active
  filter :website
  filter :bank_account
  filter :bank_ifsc
  filter :bank_type
  filter :qrcode_active
  filter :state
  filter :district
  filter :city
  filter :area
  # filter :published
  # filter :established_date
  # filter :owner_designation
  # filter :work_phone_number
  # filter :short_url
  # filter :promotion_type
  # filter :plan_id
  # filter :qr_publish
  # filter :bank_name
  # filter :legal_publish
  # filter :business_pan_card
  # filter :gst_number
  # filter :service_publish
  # filter :catalog_publish
  # filter :social_media_publish
  # filter :photo_gallery_publish
  # filter :video_gallery_publish
  # filter :feedback_publish
  # filter :enquiry_publish
  # filter :external_portal_publish
  # filter :achivement
end
