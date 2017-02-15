module OrdersHelper
  def render_order_paid_state(order)
    if order.is_paid?
      "已完成付款"
    else
      "尚未完成付款"
    end
  end
end
