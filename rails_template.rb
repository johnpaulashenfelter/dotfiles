gem "i18n-tasks"
gem "rack-canonical-host"
gem "recipient_interceptor"
gem "title"

gem_group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop"
end

gem_group :development do
  gem "foreman"
  gem "gem-licenses"
  gem "guard-rspec"
end

gem_group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "webmock"
end

run "bundle install"

generate "rspec:install"

file '.env', <<-CODE
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

file '.rspec', <<-CODE
--require spec_helper
CODE

file 'Procfile', <<-CODE
web: bundle exec puma -p $PORT -C ./config/puma.rb
CODE

file 'spec/spec_helper.rb', <<-CODE
if ENV.fetch("COVERAGE", false)
  require "simplecov"

  if ENV["CIRCLE_ARTIFACTS"]
    dir = File.join(ENV["CIRCLE_ARTIFACTS"], "coverage")
    SimpleCov.coverage_dir(dir)
  end

SimpleCov.start "rails"
end

require "webmock/rspec"

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
  config.order = :random
end

WebMock.disable_net_connect!(allow_localhost: true)
CODE

file 'spec/rails_helper.rb', <<-CODE
ENV["RACK_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)
abort("DATABASE_URL environment variable is set") if ENV["DATABASE_URL"]

require "rspec/rails"
require "shoulda/matchers"

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
end

RSpec.configure do |config|
  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

ActiveRecord::Migration.maintain_test_schema!
CODE

rakefile("bundler-audit.rake") do
<<-TASK
if Rails.env.development? || Rails.env.test?
  require "bundler/audit/task"
  Bundler::Audit::Task.new
end
TASK
end

run "rm README.md"
run "rm -rf test/"

after_bundle do
  run "bin/bundle exec guard init"

  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end

