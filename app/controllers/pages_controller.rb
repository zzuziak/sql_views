class PagesController < ApplicationController
  def home
    query = <<-SQL
      SELECT *
      FROM m_international_user_orders
    SQL

    @international_orders = ActiveRecord::Base.connection.execute(query).to_a
  end

  def user_orders
    # to do: display total orders and account_type per user
    query = <<-SQL
      SELECT
        _user_id,
        _user_name,
        _user_phone,
        COUNT(id) as total_orders
      FROM m_international_user_orders
      GROUP BY 1, 2, 3
    SQL

    @international_total_orders = ActiveRecord::Base.connection.execute(query).to_a
  end

end
