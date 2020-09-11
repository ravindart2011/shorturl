namespace :db do

  # run: rake db:mark_expire
  desc "Run rake task to mark older links expired"
  task mark_expire: :environment do
    Link.expire_links
  end

end
