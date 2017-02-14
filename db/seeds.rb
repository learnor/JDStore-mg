User.create!([
  {email: "admin@test.com", encrypted_password: "$2a$11$k6o2s7.fXlV4szXLDeodYuYkP1fwvQQrkHpA971QcnGssPk/Zo186", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-02-14 18:17:31", last_sign_in_at: "2017-02-14 18:17:31", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", is_admin: true}
])
Cart.create!([
  {}
])
Product.create!([
  {title: "Herman Miller Aeron", description: "程序员神器之坐一天也不会累的椅子。", quantity: 5, price: 999, image: "aeron.jpg"},
  {title: "Bose QC35", description: "魔音灌耳的消噪耳机。", quantity: 10, price: 399, image: "Bose_qc35.jpg"}
])
