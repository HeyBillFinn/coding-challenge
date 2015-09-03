class Student < ActiveRecord::Base
  has_many :exercises, dependent: :destroy
  validates :email_address,
    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
              message: "Email address not valid." },
    allow_blank: false

  def unique_hash
    Student.hashids.encode(id)
  end

  def self.id_from_unique_hash(hash)
    Student.hashids.decode(hash)[0]
  end

  def self.find_by_unique_hash(hash:, exercise_id: nil)
    query = Student.includes(:exercises)
    query = query.where(exercises: { id: exercise_id }) if exercise_id
    query.find(Student.id_from_unique_hash(hash))
  end

  private
    def self.hashids
      @hashIds ||= Hashids.new("7YTg1aYAmIL8FU_uaEMTAw", 10)
    end
end
