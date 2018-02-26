namespace :app do
  desc "Insertion des données necesaires pour faire marcher l'application"
  task load_data: :environment do
    Rake::Task['db:reset'].invoke
    Rake::Task['app:load_user'].invoke
    Rake::Task['app:load_categorie'].invoke
    Rake::Task['app:load_article'].invoke
    Rake::Task['app:load_comment'].invoke
    Rake::Task['app:load_guest'].invoke
    Rake::Task['app:load_tag'].invoke
    Rake::Task['app_api:creer_client'].invoke
  end

  desc "Insertion utilisateur"
  task load_user: :environment do
    puts "-- ajout utilisateur"
    User.create! email:"admin@yopmail.com", password: "admin1"
  end

  desc "Insertion categories"
  task load_categorie: :environment do
    puts "-- ajout des categories"
    4.times do |i|
      Category.create! libelle: "categories #{i+1}"
    end
  end

  desc "Insertion Articles avec categorie"
  task load_article: :environment do
    puts "-- ajout des articles avec categorie"
    Category.all.each do |categorie|
      2.times do |i|
        categorie.articles.create! titre: "Article numero #{i+1} categorie #{categorie.id}"
      end
    end
  end

  desc "Insertion des commentaires"
  task load_comment: :environment do
    puts "-- ajout des commentaires pour les articles"
    Article.all.each do |article|
      5.times do |i|
        article.comments.create! content: "commentaire numeros #{i+1} pour l'article id: #{article.id}"
      end
    end
  end

  desc "Insertion guests"
  task load_guest: :environment do
    puts "-- ajout des guests"
    Comment.all.each do |comment|
      comment.guest = Guest.create name: "nom guest pour comentaire id: #{comment.id}"
    end
  end

  desc "Insertion Tag"
  task load_tag: :environment do
    puts "-- ajout des tags"
    Article.all.each do |article|
      3.times do |i|
        article.tags.create libelle: "tag #{i+1} pour l'article id: #{article.id}"
      end
    end
  end

end
