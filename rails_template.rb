gem "i18n-tasks"
gem "rack-canonical-host"
gem "recipient_interceptor"
gem "title"

gem_group :development do
  gem "gem-licenses"
  gem "guard-rspec"
end

gem_group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", require: false
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop-rails", require: false
end

gem_group :test do
  gem "capybara", ">= 2.15"
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "webdrivers"
  gem "webmock"
end

run "bundle install"

file ".env", <<~CODE
  # https://github.com/ddollar/forego
  ASSET_HOST=localhost:3000
  APPLICATION_HOST=localhost:3000
  PORT=3000
  RACK_ENV=development
  RACK_MINI_PROFILER=0
  SECRET_KEY_BASE=development_secret
  EXECJS_RUNTIME=Node
  SMTP_ADDRESS=smtp.example.com
  SMTP_DOMAIN=example.com
  SMTP_PASSWORD=password
  SMTP_USERNAME=username
  WEB_CONCURRENCY=1
CODE

file "Procfile", <<~CODE
  web: bundle exec puma -p $PORT -C ./config/puma.rb
CODE

file ".rspec", <<~CODE
  --require spec_helper
CODE

application do
"
  config.generators do |g|
    g.javascripts     false
    g.stylesheets     false
    g.orm             :active_record
    g.template_engine :erb
    g.test_framework  :rspec,
      fixtures:         false,
      helper_specs:     false,
      request_specs:    false,
      routing_specs:    false,
      view_specs:       false,
  end
"
end

file "spec/spec_helper.rb", <<~CODE
  if ENV.fetch("COVERAGE", false)
    require "simplecov"
    SimpleCov.start "rails"
  end

  require "webmock/rspec"

  # http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
  RSpec.configure do |config|
    config.expect_with :rspec do |expectations|
      expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    end

    config.mock_with :rspec do |mocks|
      mocks.verify_partial_doubles = true
    end

    config.shared_context_metadata_behavior = :apply_to_host_groups

    config.filter_run_when_matching :focus
    config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
    config.disable_monkey_patching!

    if config.files_to_run.one?
      config.default_formatter = "doc"
    end

    config.profile_examples = 10

    config.order = :random
    Kernel.srand config.seed
  end

  WebMock.disable_net_connect!(allow_localhost: true)
CODE

file "spec/rails_helper.rb", <<~'CODE'
  require "spec_helper"
  ENV["RAILS_ENV"] ||= "test"

  require File.expand_path("../config/environment"', __dir__)
  abort("DATABASE_URL environment variable is set") if ENV["DATABASE_URL"]

  require "rspec/rails"
  require "shoulda/matchers"

  Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }

  begin
    ActiveRecord::Migration.maintain_test_schema!
  rescue ActiveRecord::PendingMigrationError => e
    puts e.to_s.strip
    exit 1
  end

  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true

    config.infer_spec_type_from_file_location!

    config.filter_rails_from_backtrace!
    ## config.filter_gems_from_backtrace("gem name")
  end
CODE

file "spec/support/shoulda.rb", <<~CODE
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
CODE

file "spec/support/factory_bot.rb", <<~CODE
  RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
  end
CODE

rakefile("bundler-audit.rake") do
<<~TASK
  if Rails.env.development? || Rails.env.test?
    require "bundler/audit/task"
    Bundler::Audit::Task.new
  end
TASK
end

after_bundle do
  run "bin/bundle exec guard init"
  run "cp $(bundle exec i18n-tasks gem-path)/templates/config/i18n-tasks.yml config/"
  run "cp $(bundle exec i18n-tasks gem-path)/templates/rspec/i18n_spec.rb spec/"
end
