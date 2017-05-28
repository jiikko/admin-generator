class Admin::SessionsController < Admin::BaseController
  skip_before_action :login_required, only: %i(new create)
  before_action :login_required, only: :destroy

  def new
    cookies.permanent[:admin] = true # analyticsの解析が入らないようにするやつ
    redirect_to admin_root_path if current_user
  end

  def create
    @user = login(params[:username], params[:password], params[:remember_me])
    if @user
      redirect_back_or_to admin_root_path, notice: 'ログインしました'
    else
      flash.now[:alert] = t('invalid_email_or_password')
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_root_url, notice: t('sign_out')
  end
end
