class Api::V1::DistrictsController < ApplicationController
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    search_term = params[:search].to_s.strip

    districts = District.all
    districts = districts.where("dist_name ILIKE ?", "%#{search_term}%") if search_term.present?
    paginated_districts = districts.page(page).per(per_page)

    if paginated_districts.any?
      render json: {
        data: paginated_districts.as_json(only: [:dist_id, :dist_name]),
        current_page: paginated_districts.current_page,
        total_pages: paginated_districts.total_pages,
        total_count: paginated_districts.total_count,
        next_page: paginated_districts.next_page,
        prev_page: paginated_districts.prev_page,
        success: true,
        status: 200
      }
    else
      render json: { message: 'No districts found' }, success: false, status: 404
    end
  end

  def show
    district = District.find_by(dist_id: params[:id])

    if district
      render json: {
        data: {
          id: district.dist_id,
          name: district.dist_name
        },
        success: true,
        status: 200
      }
    else
      render json: { message: 'District not found' }, success: false, status: 404
    end
  end
end
