class Article < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :tags
  # get All Article With category
  def self::getAllArticleWithCategory
    Article.includes(:tags,:comments).select('articles.*, categories.id as idCategory, categories.libelle as libelleCategory')
    .joins(:category)
  end
  # get articles tags
  def getTags
      self.tags
  end
end
