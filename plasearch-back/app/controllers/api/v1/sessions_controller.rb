class Api::V1::SessionsController < ApplicationController

    # login
  def create
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      login!
      render json: { user: @user },
             status: :created #201
    else
      render json: { errors: ['認証に失敗しました。', 
                              '正しいメールアドレス・パスワードを入力し直すか、新規登録を行ってください。'] },
             status: :unauthorized #401
    end
  end

    # logout
  def destroy
    if reset_session
      render status: :no_content #204
    else
      render status: :conflict #409
    end
  end

    # logged_in?
  def show
    if @current_user
      render json: { user: current_user },
             status: :ok #200
    else
      render json: { message: 'ユーザーが存在しません' },
             status: :not_found #404
    end
  end

  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end