ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "a26ebaa5ecbd4d12944c87629a50e40d"
  config.secret = "b3f2b7f48a128160541864cd2a15a479"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
