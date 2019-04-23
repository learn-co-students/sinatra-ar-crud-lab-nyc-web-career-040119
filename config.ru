
require './config/environment'

begin
  # fi_check_migration

  use Rack::MethodOverride
  run ApplicationController
  run ArticleController

rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
