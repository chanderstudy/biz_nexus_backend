class Api::V1::BusinessCardsController < ApplicationController
  protect_from_forgery with: :null_session

  def by_category_subcategory
    category_ids = params[:category_ids].present? ? params[:category_ids].split(',').map(&:to_i) : []
    subcategory_ids = params[:subcategory_ids].present? ? params[:subcategory_ids].split(',').map(&:to_i) : []
    business_cards = BusinessCard.all

    if category_ids.present?
      subcategory_ids_from_categories = BusinessSubCategory.where("business_category_ids && ARRAY[?]::integer[]", category_ids).pluck(:id)
      subcategory_ids += subcategory_ids_from_categories
    end

    if subcategory_ids.present?
      business_cards = business_cards.where('? = ANY(business_sub_category_ids)', subcategory_ids)
    end

    
    return render json: {"messages": "No Card Found"} unless category_ids.present? or subcategory_ids.present?

    if business_cards.present?
      render json: {
        data: business_cards.as_json(
          include: [
            :business_seo_profile,
            # :state,
            # :district,
            # :city,
            # :area,
            :portal,
            faqs: {},
            documents: {
              methods: :file_url
            }
          ],
          methods: [:category_data]
        ),
        success: true,
        status: 200
      }
    else
      render json: { message: 'No business cards found for the given categories or subcategories' }, success: false, status: 404
    end
  end

  def show
    business_card = BusinessCard.find_by(id: params[:id])
    if business_card.present?
      render json: {
        data: business_card.as_json(
          include: [
            :business_seo_profile,
            :state,
            :district,
            :city,
            :area,
            :portal,
            faqs: {},
            documents: {
              methods: :file_url
            }
          ],
          methods: [:category_data]
        ),
        success: true,
        status: 200
      }
    else
      render json: { message: 'Business card not found' }, success: false, status: 404
    end
  end


  def categories
    categories = BusinessCategory.all
    categories_with_subcategories = categories.map do |category|
      categories = BusinessSubCategory.where('? = ANY(business_category_ids)', category.id)
      if categories.present?
        cards_count = BusinessCard.where('business_sub_category_ids && ARRAY[?]::integer[]', categories.pluck(:id)).count
      else
        cards_count = 0
      end
      {
        id: category.id,
        name: category.name,
        description: category.description,
        priority: category.priority,
        slug: category.slug,
        cards_count: cards_count,
        business_sub_categories: categories.as_json(
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
            :business_seo_profile,
            # :state,
            # :district,
            # :city,
            # :area,
            :portal,
            faqs: {},
            documents: {
              methods: :file_url
            }
          ],
          methods: [:category_data]
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
            :business_seo_profile,
            # :state,
            # :district,
            # :city,
            # :area,
            :portal,
            faqs: {},
            documents: {
              methods: :file_url
            }
          ],
          methods: [:category_data]
        ),
        next_page: business_cards.next_page.present?
      }, success: true, status: 200
    else
      render json: { message: 'No results found' }, success: false, status: 404
    end
  end
end
