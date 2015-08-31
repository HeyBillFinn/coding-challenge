class StudentsController < ApplicationController
  def new
    if new_student_params
      create
    else
      render "new"
    end
  end

  def update
    @student = Student.find(hashids.decode(params[:unique_hash])[0])
    @student.update_attributes(update_student_params)
  end

  def create
    @student = Student.new(new_student_params)
    if @student.save
      redirect_to(student_path(hashids.encode(@student.id)))
    else
      render "new"
    end
  end

  def show
    @student = Student.find(hashids.decode(params[:unique_hash])[0])
  end

  private
    def new_student_params
      if params[:student].nil? || params[:student].empty?
        return false
      else
        return params.require(:student).permit(:name, :email_address)
      end
    end

    def update_student_params
      params.require(:student).permit(:exercise_response)
    end

    def hashids
      @hashIds ||= Hashids.new("7YTg1aYAmIL8FU_uaEMTAw", 10)
    end
end
