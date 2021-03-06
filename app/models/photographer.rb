class Photographer < ActiveRecord::Base
  has_one :profile, autosave: true

  has_secure_password

  before_create :set_token

  validates :email, uniqueness: true

  def self.login(email, password)
    photographer = find_by email: email
    photographer.login password if photographer
  end

  def login (password)
    authenticate(password) && set_token && save! && self # self is now the photographer logging in
  end

  private

  def set_token
    self.token = SecureRandom.hex
  end
end
