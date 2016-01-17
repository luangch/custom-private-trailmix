namespace :users do
  desc "TODO"
  task :destroy_all => :production do
  	User.destroy_all
  end

end