class Ong < ApplicationRecord
  validates :nome, presence: true, length: { maximum: 50 }

  before_save :email_downcase

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: true }
  validates :estado, presence: true, length: { maximum: 50 }

  private
  def email_downcase
    self.email.downcase!
  end
end
