class Sub < ApplicationRecord
  
  validates :title, :description, presence: true
  
  has_many :moderators,
    foreign_key: :moderator_id, 
    class_name: :User
    
  has_many :post_subs

  has_many :posts, 
    through: :post_subs,
    source: :post
  
    
end
