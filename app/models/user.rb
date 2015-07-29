class User < ActiveRecord::Base
  has_many :todo_items

  has_secure_password

  validates :email
  presence: true,
  uniqueness: {case_sensative: false},
  format: {width: /@/}

   def display_name
    self.name || 'Anon'
  end

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end


end
