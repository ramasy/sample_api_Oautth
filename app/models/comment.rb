class Comment < ApplicationRecord
  belongs_to :article
  has_one :guest
end
