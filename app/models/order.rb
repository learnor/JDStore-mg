class Order < ApplicationRecord
  has_many :product_lists

  before_action :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end
end
