require 'SecureRandom'

class StudentsController < ApplicationController
  def new
  end

  def create
    @student = Student.new(article_params)
    @student.save
    
    hashids = Hashids.new("7YTg1aYAmIL8FU_uaEMTAw", 10)
    @student.unique_hash = hashids.encode(@student.id)
    @student.save

    redirect_to(student_path(@student.unique_hash))
  end

  def show
    @student = Student.find_by(unique_hash: params[:unique_hash])
  end

  private
    def article_params
      params.require(:student).permit(:name, :email_address)     
    end
end
