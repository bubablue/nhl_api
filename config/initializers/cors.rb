Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins 'localhost:3000', '
        http://localhost:3000'
        resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end
    # allow do
    #     origins 'https://www.example.com', 'https://example.com'
    #     resource '*',
    #     headers: :any,
    #     methods: [:get, :post, :put, :patch, :delete, :options, :head],
    #     credentials: true
    # end
end