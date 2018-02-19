namespace :app_api do
  desc "creer client pour api"
  task creerClient: :environment do
    puts "/!\\ Creation client API"
    client = Doorkeeper::Application.new :name => 'test', :redirect_uri => 'http://example.com'
    client.save
    puts "=> client id : #{client.uid}"
    puts "=> client secret : #{client.secret}"
  end

end
