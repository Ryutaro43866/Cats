class Item < ApplicationRecord
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :item_comments, dependent: :destroy

  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :introduction, presence: true

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.search(search)
    if search != ""
      Item.where(['title LIKE(?)', "%#{search}%"])
    else
      Item.all
    end
  end
  
end
