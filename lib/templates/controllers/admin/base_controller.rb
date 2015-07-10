class Admin::BaseController < ApplicationController
  before_action :login_required
  layout 'admin/application'

  private

  def login_required
    unless current_user
      redirect_to admin_login_path
    end
  end
end
