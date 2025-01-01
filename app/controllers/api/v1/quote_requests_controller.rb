class Api::V1::QuoteRequestsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @quote_request = QuoteRequest.new(quote_request_params)

    if @quote_request.save
      render json: { success: true, message: "Quote request created successfully." }, status: :created
    else
      render json: { success: false, errors: @quote_request.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Strong parameters to permit required fields
  def quote_request_params
    params.require(:quote_request).permit(
      :quotable_type,
      :quotable_id,
      :name,
      :email,
      :phone,
      :message
    )
  end
end
