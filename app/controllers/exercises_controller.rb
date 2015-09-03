class ExercisesController < ApplicationController
  def show
    @student = Student.find_by_unique_hash(hash: params[:student_unique_hash],
                                          exercise_id: params[:id])
    @exercise = @student.exercises.first
  end

  def update
    @student = Student.find_by_unique_hash(hash: params[:student_unique_hash],
                                          exercise_id: params[:id])
    @exercise = @student.exercises.first
    render "show"
  end
end
