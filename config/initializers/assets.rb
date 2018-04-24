Rails.application.config.assets.version = "1.0"
Rails.application.config.assets.precompile += %w(admin.css
  ticket.css)
Rails.application.config.assets.precompile += %w(admin.js
  home_slide.js
  ticket.js
  booking.js)
Rails.application.config.assets.paths << Rails.root.join("node_modules")
