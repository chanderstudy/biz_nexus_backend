ActiveAdmin.register BusinessCard do
  menu parent: "Manage Business Card"
  filter :name
  permit_params :name, :owner_name, :email, :address, :landmark, :mobile, 
                :latitude, :longitude, :bcard_type, :bcard_power, 
                :seo_active, :website, :bank_account, :bank_ifsc, :bank_type, 
                :state_id, :district_id, :city_id, :area_id, :portal_id,
                :description, :owner_designation, :work_phone_number, 
                :established_date, :short_url, :published, :promotion_type, 
                :plan_id, :qr_publish, :bank_name, :legal_publish, 
                :business_pan_card, :gst_number, :service_publish, :business_card_for,
                :catalog_publish, :social_media_publish, :photo_gallery_publish, 
                :video_gallery_publish, :feedback_publish, :enquiry_publish, 
                :external_portal_publish, :achivement, :created_by_id, 
                :managed_by_id, :owned_by_id, :country_id, :continent_id,
                business_seo_profile_attributes: [:id, :active, :keywords, :meta_tag, :description, :_destroy],
                faqs_attributes: [:id, :question, :answer, :_destroy],
                documents_attributes: [:id, :title, :document_type, :status, :file, :_destroy],
                social_media_links_attributes: [:id, :social_media_type, :priority, :title, :url, :status, :_destroy],
                business_sub_category_ids: []

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
    column :business_card_for
    column :bcard_power
    column :business_sub_categories do |card|
      BusinessSubCategory.where(id: card.business_sub_category_ids).pluck(:name).join(', ')
    end
    column :seo_active
    column :website
    column :bank_account
    column :bank_ifsc
    column :bank_type
    column :continent # Added
    column :country   # Added
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
    column :achivement
    column :owned_by
    column :created_by
    column :managed_by
    actions
  end

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
      f.input :business_card_for
      f.input :bcard_power
      f.input :business_sub_category_ids, as: :select, 
         collection: BusinessSubCategory.pluck(:name, :id), 
         input_html: { multiple: true }
      f.input :seo_active
      f.input :website
      f.input :bank_account
      f.input :bank_ifsc
      f.input :bank_type
      f.input :continent, as: :searchable_select, fields: [:name], display_name: 'Continent'
      f.input :country, as: :searchable_select, fields: [:name], display_name: 'Country'
      f.input :state, as: :select, collection: State.pluck(:state_name, :state_id), label: 'State'
      f.input :district, as: :select, collection: District.pluck(:dist_name, :dist_id), label: 'District'
      f.input :city, as: :select, collection: City.pluck(:city_name, :city_id), label: 'City'
      f.input :area, as: :select, collection: Area.pluck(:area_name, :area_id), label: 'Area'
      f.input :portal, as: :select, collection: Portal.pluck(:portal_name, :id), label: 'Portal'
      f.input :description
      f.input :owner_designation
      f.input :work_phone_number
      f.input :established_date
      f.input :short_url
      f.input :published
      # f.input :promotion_type, as: :select, 
      #   collection: [['Free listing', 'free_listing'],['Promotion', 'promotion'], ['Advertisement', 'advertisement']],
      #   include_blank: false, 
      #   input_html: { value: 'free_listing' }
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
      f.input :owned_by, as: :select, collection: User.pluck(:email, :id), label: 'Owned By User'
      f.input :created_by, as: :select, collection: AdminUser.pluck(:email, :id), label: 'Created By'
      f.input :managed_by, as: :select, collection: AdminUser.pluck(:email, :id), label: 'Managed By'
    end

    f.has_many :social_media_links, heading: 'Social Media Links', allow_destroy: true, new_record: true do |sml|
      sml.input :social_media_type
      sml.input :priority
      sml.input :title
      sml.input :url
      sml.input :status, as: :select, collection: SocialMediaLink.statuses.keys.map { |status| [status.humanize, status] }, label: 'Status'
      sml.input :_destroy, as: :boolean, label: 'Delete this Social Media Link?'
    end

    f.has_many :business_seo_profile, heading: 'SEO Profile', allow_destroy: true, new_record: true do |bsp|
      bsp.input :active
      bsp.input :keywords
      bsp.input :meta_tag
      bsp.input :description
      bsp.input :_destroy, as: :boolean, label: 'Delete this SEO Profile?'
    end

    f.has_many :faqs, heading: 'FAQs', allow_destroy: true, new_record: true do |faq|
      faq.input :question
      faq.input :answer
      faq.input :_destroy, as: :boolean, label: 'Delete this FAQ?'
    end

    f.has_many :documents, heading: 'Documents', allow_destroy: true, new_record: true do |doc|
      doc.input :title
      doc.input :document_type, as: :select, collection: ['Galllery Photo', 'Galllery Video', 'Page Banner', 'Catalog Pdf', 'Catalog Video', 'Catalog Photo', 'QR Code Payment', 'QR Code Location', 'Logo', 'Thumbnail']
      doc.input :status
      doc.input :file, as: :file
      doc.input :_destroy, as: :boolean, label: 'Delete this Document?'
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :owner_name
      row :email
      row :address
      row :landmark
      row :mobile
      row :latitude
      row :longitude
      row :bcard_type
      row :business_card_for
      row :bcard_power
      row :business_sub_categories do |card|
        BusinessSubCategory.where(id: card.business_sub_category_ids).pluck(:name).join(', ')
      end
      row :seo_active
      row :website
      row :bank_account
      row :bank_ifsc
      row :bank_type
      row :continent
      row :country
      row :state
      row :district
      row :city
      row :area
      row :portal
      row :description
      row :owner_designation
      row :work_phone_number
      row :established_date
      row :short_url
      row :published
      row :promotion_type
      row :plan_id
      row :qr_publish
      row :bank_name
      row :legal_publish
      row :business_pan_card
      row :gst_number
      row :service_publish
      row :catalog_publish
      row :social_media_publish
      row :photo_gallery_publish
      row :video_gallery_publish
      row :feedback_publish
      row :enquiry_publish
      row :external_portal_publish
      row :achivement
      row :owned_by
      row :created_by
      row :managed_by

      panel "SEO Profile" do
        table_for business_card.business_seo_profile do
          column :keywords
          column :meta_tag
          column :description
        end
      end

      panel "Social Media Links" do
        table_for resource.social_media_links do
          column "Type" do |sml| sml.social_media_type end
          column "Priority" do |sml| sml.priority end
          column "Title" do |sml| sml.title end
          column "URL" do |sml| link_to sml.url, sml.url, target: "_blank" end
          column "Status" do |sml| sml.status end
        end
      end

      panel "FAQs" do
        table_for resource.faqs do
          column :question
          column :answer
        end
      end

      panel "Documents" do
        table_for resource.documents do
          column :title
          column :document_type
          column :status
          column :file do |doc|
            link_to 'View', rails_blob_path(doc.file, disposition: "attachment"), target: "_blank" if doc.file.attached?
          end
        end
      end
    end
  end
end
