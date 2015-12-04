require 'bcrypt'
class User
  include BCrypt
  attr_accessor :password, :password_confirmation
  include DataMapper::Resource
  validates_confirmation_of :password, message: 'Sorry, your passwords don\'t match'

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, Text

  before :save do
    if password == password_confirmation
      self.password_digest = BCrypt::Password.create(password)
    else
      break
    end
  end
  # def password
  #   @password ||= Password.new(password_digest)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_digest = @password
  # end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
  end
end
