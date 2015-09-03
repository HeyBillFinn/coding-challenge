class ExercisesController < ApplicationController
  def show
    @student = Student.find_by_unique_hash(hash: params[:student_unique_hash],
                                          exercise_id: params[:id])
    @exercise = @student.exercises.first
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
    render "show"
  end
end
