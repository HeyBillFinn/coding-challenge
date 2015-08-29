class StudentsController < ApplicationController
  def new
  end

  def create
    @student = Student.new(article_params)

    @student.save
    redirect_to @student
  end

  def show
    @student = Student.find(params[:id])
  end

  private
    def article_params
      params.require(:student).permit(:name, :email_address)     
    end
end
