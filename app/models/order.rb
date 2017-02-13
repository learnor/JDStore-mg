class Order < ApplicationRecord
  has_many :product_lists
  belongs_to :user

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end
end
