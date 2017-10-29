class Comic < ApplicationRecord
  belongs_to :user

  has_attached_file :cover, styles: { medium:'300x300>', thumb: '100x100>' }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
end
