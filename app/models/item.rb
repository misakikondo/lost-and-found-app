class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :items_name
    validates :persons_name
    validates :memos
    validates :places
    validates :found_date
  end
end
