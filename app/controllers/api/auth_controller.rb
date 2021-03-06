class Api::AuthController < ApplicationController
  def render_data(data, status)
    render json: data, status: status, callback: params[:callback]
  end

  def render_error(message, status = :unprocessable_entity)
    render_data({ error: message }, status)
  end

  def render_success(data, status = :ok)
    if data.is_a? String
      render_data({ message: data }, status)
    else
      render_data(data, status)
    end
  end

  def signup
    @user = User.new auth_params
    
    if @user.save
      render_success({ token: Token.encode(@user.id) })
    else
      render json: { message: 'Invalid Credentials'}, status: :unauthorized
    end
  end

  def login
    @user = User.find_by email: params[:email] if params[:email].present?

    if @user && @user.valid_password?(params[:password])
      render json: { token: Token.encode(@user.id), status: 'success'}
    else
      render json: { message: 'Invalid Credentials', status: 'failed'}
    end
  end

  def authenticate
    @oauth = "Oauth::#{params['provider'].titleize}".constantize.new(params)     
    if @oauth.authorized?
      @user = User.for_oauth(@oauth)
      @user && render_success({token: Token.encode(@user.id)})
    else
      render_error("There was an error with #{params['provider']}. please try again.")
    end
  end

  private

    def auth_params
      params.require(:auth).permit(:email, :password, :full_name) rescue {}
    end
end