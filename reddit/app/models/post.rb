# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

    has_many :comments,
        primary_key: :id,
        foreign_key: :post_id,
        class_name: 'Comment'
        
end
