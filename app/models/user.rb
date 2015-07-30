class User < ActiveRecord::Base
  has_many :todo_items

  has_secure_password

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false},
  format: {with: /@/}


  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
