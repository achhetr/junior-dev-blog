class User < ApplicationRecord
  before_save :email_downcase, :username_downcase

  has_many :articles
  
  validates :username, presence: true, 
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }

  private
  def email_downcase
    self.email = email.downcase
  end

  def username_downcase
    self.username = username.downcase
  end
end