Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shopify,
           ShopifyApp.configuration.api_key,
           ShopifyApp.configuration.secret,
           scope: ShopifyApp.configuration.scope,
           callback_path: 'nested/auth/shopify/callback', # added
           per_user_permissions: true, # added
           setup: lambda { |env|
             strategy = env['omniauth.strategy']

             shopify_auth_params = strategy.session['shopify.omniauth_params']&.with_indifferent_access
             shop = if shopify_auth_params.present?
               "https://#{shopify_auth_params[:shop]}"
             else
               ''
             end

             strategy.options[:client_options][:site] = shop
           }
end
