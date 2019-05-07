# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint           not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ApplicationRecord
    validates :sub_id, uniqueness: {scope: :post_id}
    
    belongs_to :sub
    belongs_to :post
end
