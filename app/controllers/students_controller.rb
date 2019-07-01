class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
  end

  def activate
    #find the student
    @student = Student.find(params[:id])
    #this toggles the status, if it started as active, it is now inactive(setting it != to itself)
    @student.active = !@student.active
    #save the changes to the db
    @student.save
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end