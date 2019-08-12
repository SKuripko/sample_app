# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w[bookings.js]
Rails.application.config.assets.precompile += %w[authorization_keys.js]
Rails.application.config.assets.precompile += %w[search_results.js]
Rails.application.config.assets.precompile += %w[bookings_info.js]
Rails.application.config.assets.precompile += %w[cancel_bookings.js]
Rails.application.config.assets.precompile += %w[fare_conditions.js]
Rails.application.config.assets.precompile += %w[fare_families.js]
Rails.application.config.assets.precompile += %w[flights_info.js]
Rails.application.config.assets.precompile += %w[payment_bookings.js]
Rails.application.config.assets.precompile += %w[payments_info.js]
Rails.application.config.assets.precompile += %w[searchs.js]
Rails.application.config.assets.precompile += %w[passenger_genetor.js]
Rails.application.config.assets.precompile += %w[passenger_generator.js]
Rails.application.config.assets.precompile += %w[hits.js]
