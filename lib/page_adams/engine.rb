module PageAdams
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl      
    end
  end
end
