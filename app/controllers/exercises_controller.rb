class ExercisesController < ApplicationController
  def index
    @student = Student.find_by_unique_hash(hash: params[:student_unique_hash])
    redirect_to(student_exercise_path(@student.unique_hash,
                                      @student.exercises.first))
  end

  def show
    @student = Student.find_by_unique_hash(hash: params[:student_unique_hash],
                                          exercise_id: params[:id])
    @exercise = @student.exercises.first
    if @exercise.state == "INITIAL"
      @exercise.exercise_begin = DateTime.now.new_offset(0)
      @exercise.state = "IN_PROGRESS"
      @exercise.save
    elsif @exercise.state == "COMPLETED"
      render "done"
    end
    @exercise_snippet = {}
    @exercise_snippet["Ruby"] =
      { text: File.open('app/views/exercises/snippets/exercise.rb').read,
        aceMode: "ace/mode/ruby" }
    @exercise_snippet["Java"] =
      { text: File.open('app/views/exercises/snippets/exercise.java').read,
        aceMode: "ace/mode/java" }
  end

  def update
    @student = Student.find_by_unique_hash(hash: params[:student_unique_hash],
                                          exercise_id: params[:id])
    @exercise = @student.exercises.first
    @exercise.exercise_end = DateTime.now.new_offset(0)
    @exercise.state = "COMPLETED"
    puts params
    @exercise.exercise_response = params[:exercise][:exercise_response]
    @exercise.language = params[:exercise][:language]
    @exercise.save
    render "done"
  end
end
