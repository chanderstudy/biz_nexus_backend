# in config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000",
            "http://127.0.0.1:3000",
            "http://localhost:3001",
            "http://127.0.0.1:3001",
            "https://nexus.vicancode.com",
            "https://nexus-app.netlify.app",
            "https://e7fa-2401-4900-5c92-516d-4093-12ea-d1f7-72d7.ngrok-free.app",
            "https://lovable.dev"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true,
      max_age: 86400
  end
end