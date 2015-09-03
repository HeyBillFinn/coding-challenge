class StudentsController < ApplicationController
  def new
    if new_student_params
      create
    else
      render "new"
    end
  end

  def create
    @student = Student.new(new_student_params)
    if @student.save
      @exercise = @student.exercises.create(state: 'INITIAL')
      redirect_to(student_path(@student.unique_hash))
    else
      render "new"
    end
  end

  def show
    @student = Student.find_by_unique_hash(hash: params[:unique_hash])
  end

  private
    def new_student_params
      if params[:student].nil? || params[:student].empty?
        return false
      else
        return params.require(:student).permit(:name, :email_address)
      end
    end
end
