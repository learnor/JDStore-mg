class Order < ApplicationRecord
  has_many :product_lists
  belongs_to :user

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end
end
