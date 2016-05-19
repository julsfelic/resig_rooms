class ApiKey < ActiveRecord::Base
  belongs_to :user

  validates :access_token, uniqueness: true

  before_create :generate_access_token

  private

  def generate_access_token
    self.access_token = SecureRandom.hex
  end
end
