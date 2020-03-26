SELECT
  orders.id,
  orders.created_at AS order_created_at,
  orders.status AS order_status,

  users.id AS _user_id,
  users.name AS _user_name,
  users.address AS _user_address,
  users.phone AS _user_phone,

  accounts.account_type AS _user_account_type

FROM orders
JOIN users ON users.id = orders.user_id
JOIN accounts ON accounts.id = users.account_id

WHERE accounts.domestic = True;
