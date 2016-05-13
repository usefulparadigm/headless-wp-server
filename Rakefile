require 'bundler/setup'
require 'padrino-core/cli/rake'

PadrinoTasks.use(:database)
PadrinoTasks.use(:mongoid)
PadrinoTasks.init

task :default => :test

# Your WordPress Site URL
WP_SITE = "http://localhost:8080/"

def wp
  WpApi.new WP_SITE
end

namespace :wp do
  desc "Sync with WordPress recent posts"
  task :sync_posts => :environment do
    posts = wp.get :posts, :_embed => true
    # puts posts.count
    Post.save_to_db(posts)
  end
end
