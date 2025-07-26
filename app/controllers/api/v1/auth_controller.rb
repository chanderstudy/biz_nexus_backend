class Api::V1::AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user_by_email, only: [:login]

  # POST /api/v1/signup
  def signup
    user = User.new(user_params)
    if user.save
      token = JsonWebToken.encode({
        user_id: user.id,
        email: user.email,
        logged_in_at: Time.current
      })

      render json: {
        message: 'User created successfully',
        token: token,
        user: user.slice(:id, :email, :name, :mobile)
      }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /api/v1/login
  def login
    user = User.find_by(email: params[:auth][:email])
    if user && user.valid_password?(params[:auth][:password])
      token = JsonWebToken.encode({
        user_id: user.id,
        email: user.email,
        logged_in_at: Time.current
      })

      render json: {
        message: 'Login successful',
        token: token,
        user: user.slice(:id, :email, :name, :mobile)
      }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def forgot_password
    user = User.find_by(email: params[:email])
    if user.present?
      user.send_reset_password_instructions
      render json: { message: "Reset instructions sent to email." }, status: :ok
    else
      render json: { error: "Email not found." }, status: :not_found
    end
  end

  def reset_password
    user = User.with_reset_password_token(params[:reset_password_token])

    if user.nil?
      render json: { error: 'Invalid or expired token' }, status: :unprocessable_entity
    elsif user.reset_password(params[:password], params[:password_confirmation])
      render json: { message: 'Password has been reset successfully' }, status: :ok
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
end

  private

  def reset_password_params
    params.permit(:reset_password_token, :password, :password_confirmation)
  end

  def set_user_by_email
    @user = User.find_by(email: params[:email])
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :mobile)
  end

  def user_data(user)
    {
      id: user.id,
      name: user.name,
      email: user.email,
      mobile: user.mobile,
      continent_id: user.continent_id,
      country_id: user.country_id,
      state_id: user.state_id,
      dist_id: user.dist_id,
      city_id: user.city_id,
      area_id: user.area_id
    }
  end
end
