class Student < ActiveRecord::Base
  validates :email_address,
    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
              message: "Email address not valid." },
    allow_blank: false
end
