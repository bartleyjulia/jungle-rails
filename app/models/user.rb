class User < ActiveRecord::Base
  has_secure_password
  has_many :review
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :first_name, :last_name, presence: true
  validates :password, length: { minimum: 8 }

  # # validate :fuckingpasswords

  # def fuckingpasswords
  #   (password && password_confirmation && password.length  >= 8) || password_digest
  # end

  def self.authenticate_with_credentials(email, password)
    email = email.downcase
    email = email.gsub(/\s+/, '')
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
