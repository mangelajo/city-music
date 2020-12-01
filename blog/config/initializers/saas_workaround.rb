# https://github.com/sass/sassc-ruby/issues/197#issuecomment-626021763
Rails.application.config.assets.configure do |env|
  env.export_concurrent = false
end

