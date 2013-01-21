class Product < ActiveRecord::Base
  default_scope :order => 'title'
  belongs_to :user
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  attr_accessible :user_id, :description, :image_url, :price, :title

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
    return false
    end
  end
end