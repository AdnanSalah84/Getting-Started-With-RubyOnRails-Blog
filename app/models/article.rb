class Article < ApplicationRecord
    # If you delete an article, its associated comments will also need to be deleted, 
    # otherwise they would simply occupy space in the database.
    has_many :comments, dependent: :destroy 
    validates :title, presence: true,
                    length: { minimum: 5 }
end
