class StudentsController < ApplicationController
  def index
    @students = Student.all
    @search = params[:search]
    @student_search_results = Student.search(params[:search])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  private

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
