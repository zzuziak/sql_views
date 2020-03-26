class CreateMInternationalUserOrders < ActiveRecord::Migration[6.0]
  def change
    create_view :m_international_user_orders, materialized: true
  end
end
