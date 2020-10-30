class StudentsController < ApplicationController

  before_action :find_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(first_name: params[:first_name], last_name: params[:last_name])
    redirect_to student_path(@student)
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_safety
    params.require(:student).permit(:first_name, :last_name)
  end

end
