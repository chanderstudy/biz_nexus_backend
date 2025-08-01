# in config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000",
            "https://www.yuktra.com",
            "https://yuktra.com",
            "https://main.d35d7103zms7ma.amplifyapp.com/",
            "https://main.dd3e70vuyw9vr.amplifyapp.com/",
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