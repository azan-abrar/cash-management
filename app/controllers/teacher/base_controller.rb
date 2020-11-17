# frozen_string_literal: true

class Teacher::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_teacher

  def authenticate_teacher
    return redirect_to root_path, alert: 'Access Denied! you are not authorized to access this page.' unless current_user.teacher?
  end
end
