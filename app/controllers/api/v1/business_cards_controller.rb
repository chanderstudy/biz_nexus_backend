class Api::V1::BusinessCardsController < ApplicationController
  protect_from_forgery with: :null_session

  def all_categories
    page = params[:page] || 1
    per_page = params[:per_page] || 10

    categories = BusinessCategory.order(priority: :asc).page(page).per(per_page)

    if categories.present?
      render json: {
        data: categories.as_json(
          only: [:id, :name, :slug, :description, :priority]
        ),
        current_page: categories.current_page,
        total_pages: categories.total_pages,
        total_count: categories.total_count,
        next_page: categories.next_page,
        prev_page: categories.prev_page,
        success: true,
        status: 200
      }
    else
      render json: { message: 'No categories found' }, success: false, status: 404
    end
  end

  def get_sub_categories
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    category_ids = params[:category_ids].present? ? params[:category_ids].split(',').map(&:to_i) : []

    if category_ids.present?
      subcategories = BusinessSubCategory.order(priority: :asc).where("business_category_ids && ARRAY[?]::integer[]", category_ids)
                                       .page(page).per(per_page)
    else
      subcategories = BusinessSubCategory.order(priority: :asc).page(page).per(per_page)
    end

    if subcategories.present?
      render json: {
        data: subcategories.as_json(
          only: [:id, :name, :slug, :description, :priority]
        ),
        current_page: subcategories.current_page,
        total_pages: subcategories.total_pages,
        total_count: subcategories.total_count,
        next_page: subcategories.next_page,
        prev_page: subcategories.prev_page,
        success: true,
        status: 200
      }
    else
      render json: { message: 'No subcategories found for the given categories' }, success: false, status: 404
    end
  end

  def by_category_subcategory
    category_ids = params[:category_ids].present? ? params[:category_ids].split(',').map(&:to_i) : []
    subcategory_ids = params[:subcategory_ids].present? ? params[:subcategory_ids].split(',').map(&:to_i) : []
    district_ids = params[:district_ids].present? ? params[:district_ids].split(',').map(&:to_i) : []
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    business_cards = BusinessCard.all

    if category_ids.present?
      # Fetch subcategory IDs associated with the provided category IDs
      subcategory_ids_from_categories = BusinessSubCategory.order(priority: :asc).where("business_category_ids && ARRAY[?]::integer[]", category_ids).pluck(:id)
      subcategory_ids += subcategory_ids_from_categories
    end

    # Correct the query to check for any overlap in subcategory IDs using the '&&' operator
    business_cards = business_cards.where('business_sub_category_ids && ARRAY[?]::integer[]', subcategory_ids) if subcategory_ids.present?
    business_cards = business_cards.where(district_id: district_ids) if district_ids.present?
    
    paginated_business_cards = business_cards.page(page).per(per_page)

    if paginated_business_cards.present?
      render json: {
        data: paginated_business_cards.as_json(
          include: [
            :business_seo_profile,
            :state,
            :district,
            :city,
            :area,
            :portal,
            :time_table,
            services: {
              methods: [:logo_url, :banner_url]
            },
            faqs: {},
            documents: {
              methods: :file_url
            }
          ],
          methods: [:category_data]
        ),
        current_page: paginated_business_cards.current_page,
        total_pages: paginated_business_cards.total_pages,
        total_count: paginated_business_cards.total_count,
        next_page: paginated_business_cards.next_page,
        prev_page: paginated_business_cards.prev_page,
        success: true,
        status: 200
      }
    else
      render json: { message: 'No business cards found for the given categories, subcategories, and districts' }, success: false, status: 404
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
            :time_table,
            :social_media_links,
            services: {
              methods: [:logo_url, :banner_url]
            },
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
    categories = BusinessCategory.order(priority: :asc).all
    categories_with_subcategories = categories.map do |category|
      subcategories = BusinessSubCategory.order(priority: :asc).where('? = ANY(business_category_ids)', category.id)
      
      subcategories_with_card_counts = subcategories.map do |subcategory|
        subcategory_cards_count = BusinessCard.where('business_sub_category_ids && ARRAY[?]::integer[]', [subcategory.id]).count
        
        if subcategory_cards_count > 0
          {
            id: subcategory.id,
            name: subcategory.name,
            description: subcategory.description,
            priority: subcategory.priority,
            slug: subcategory.slug,
            logo_url: subcategory.logo_url,
            banner_url: subcategory.banner_url,
            cards_count: subcategory_cards_count
          }
        end
      end.compact # Remove nil values for subcategories with no cards
      
      total_cards_count = subcategories_with_card_counts.sum { |subcat| subcat[:cards_count] }

      if total_cards_count > 0
        {
          id: category.id,
          name: category.name,
          description: category.description,
          priority: category.priority,
          slug: category.slug,
          logo_url: category.logo_url,
          cards_count: total_cards_count,
          banner_url: category.banner_url,
          business_sub_categories: subcategories_with_card_counts
        }
      end
    end.compact # Remove nil values for categories with no cards

    render json: { data: categories_with_subcategories }
  end


  def index
    business_cards = BusinessCard.page(params[:page] || 1).per(params[:per_page] || 10)

    if business_cards.present?
      render json: {
        data: business_cards.as_json(
          include: [
            :business_seo_profile,
            :state,
            :district,
            :city,
            :area,
            :portal,
            :time_table,
            :social_media_links,
            services: {
              methods: [:logo_url, :banner_url]
            },
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
            :state,
            :district,
            :city,
            :area,
            :portal,
            :time_table,
            :social_media_links,
            faqs: {},
            services: {
              methods: [:logo_url, :banner_url]
            },
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
