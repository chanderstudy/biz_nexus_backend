class Api::V1::BusinessCardsController < ApplicationController
  protect_from_forgery with: :null_session

  def categories
    categories = BusinessCategory.all
    categories_with_subcategories = categories.map do |category|
      {
        id: category.id,
        name: category.name,
        description: category.description,
        priority: category.priority,
        slug: category.slug,
        business_sub_categories: BusinessSubCategory.where('? = ANY(business_category_ids)', category.id).as_json(
          only: [:id, :name, :description, :priority, :slug]
        )
      }
    end
    render json: { data: categories_with_subcategories }
  end

  def index
    business_cards = BusinessCard.page(params[:page] || 1)

    if business_cards.present?
      render json: {
        data: business_cards.as_json(
          include: [
            :social_media_profile,
            :business_seo_profile,
            :state,
            :district,
            :city,
            :area,
            {
              business_sub_category: {
                include: {
                  business_categories: {
                    only: [:id, :name] # Include only id and name for business_category
                  }
                },
                only: [:id, :name, :description, :code, :slug, :priority, :publish] # Include fields for business_sub_category
              }
            },
            :portal,
            faqs: {},
            documents: {
              methods: :file_url
            }
          ]
        ),
        next_page: business_cards.next_page.present?
      }, success: true, status: 200
    else
      render json: { message: 'No data found' }, success: false, status: 404
    end
  end

  def search
    # Build Ransack search query
    business_cards = BusinessCard.ransack(params[:q]).result.page(params[:page] || 1)

    if business_cards.present?
      render json: {
        data: business_cards.as_json(
          include: [
            :social_media_profile,
            :business_seo_profile,
            :state,
            :district,
            :city,
            :area,
            {
              business_sub_category: {
                include: {
                  business_categories: {
                    only: [:id, :name] # Include only id and name for business_category
                  }
                },
                only: [:id, :name, :description, :code, :slug, :priority, :publish] # Include fields for business_sub_category
              }
            }
          ]
        ),
        next_page: business_cards.next_page.present?
      }, success: true, status: 200
    else
      render json: { message: 'No results found' }, success: false, status: 404
    end
  end
end
