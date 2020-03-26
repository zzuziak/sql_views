class CreateInternationalUserOrders < ActiveRecord::Migration[6.0]
  def change
    create_view :international_user_orders
  end
end
