ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "a26ebaa5ecbd4d12944c87629a50e40d"
  config.secret = "b3f2b7f48a128160541864cd2a15a479"
  config.scope = "read_orders, read_products, read_cutomers, write_products, write_script_tags" #read_cutomers and write_products
  config.embedded_app = true
  config.after_authenticate_job = {job: Shopify::AfterAuthenticateJob, inline: true}
  config.session_repository = Shop
  config.root_url = '/nested' # added
  config.webhooks_jobs_namespace = 'shopify/webhooks'
  config.webhooks = [
  	{topic: 'carts/update', address: 'https://example-app.com/webhooks/carts_update'}
  ]
  config.webhooks = [
    {topic: 'products/update', address: 'https://example-app.com/webhooks/products_update', fields: ['title', 'vendor']}
  ]
  config.scripttags = [
  	{event: 'onload', src: 'http://localhost:3000/fancy.js'}
  ]
  config.scripttags = [
  	{event: 'onload', src: ->(domain) {dynamic_tag_url(domain)} }
  ]
end
