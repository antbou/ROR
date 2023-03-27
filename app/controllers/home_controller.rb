# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_user && current_user.student?
      @evaluations = current_user.evaluations
      render 'student_home'
    elsif current_user && current_user.teacher?
      render 'teacher_home'
    else
      render 'home'
    end
  end
end
