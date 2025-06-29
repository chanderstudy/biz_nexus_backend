# in config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000",
            "https://main.d2p17lonhmwyyi.amplifyapp.com",
            "http://localhost:3001",
            "https://nexus.vicancode.com",
            "https://nexus-app.netlify.app",
            "https://lovable.dev"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true,
      max_age: 86400
  end
end