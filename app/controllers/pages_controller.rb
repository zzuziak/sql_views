class PagesController < ApplicationController
  def home
    query = <<-SQL
      SELECT *
      FROM orders
      JOIN users ON users.id = orders.user_id
      JOIN accounts ON accounts.id = users.account_id
      WHERE accounts.domestic = False;
    SQL

    @international_orders = ActiveRecord::Base.connection.execute(query).to_a
  end

end
