class Post < ApplicationRecord

    validates :title, presence: true

    has_many :postsubs,
        primary_key: :id,
        foreign_key: :post_id,
        class_name: 'PostSub',
        inverse_of: :post 

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: 'User'

    has_many :subs,
        through: :postsubs,
        source: :sub
end