# frozen_string_literal: true

class Student::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_student

  def authenticate_student
    return redirect_to root_path, alert: 'Access Denied! you are not authorized to access this page.' unless current_user.student?
  end
end
