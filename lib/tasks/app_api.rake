namespace :app_api do
  desc "creer client pour api"
  task creer_client: :environment do
    puts "/!\\ Creation client API"
    client = Doorkeeper::Application.new :name => 'test', :redirect_uri => 'https://www.example.com'
    client.save
    puts "=> client id : #{client.uid}"
    puts "=> client secret : #{client.secret}"
  end

end
