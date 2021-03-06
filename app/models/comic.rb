class Comic < ApplicationRecord
  belongs_to :user
  has_many :publications, dependent: :destroy
  has_many :forums, dependent: :destroy

  has_attached_file :cover, styles: { medium:'300x300>', thumb: '100x100>' }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  def paid_by? (user)
    Payment.where(user_id: user.id, comic_id: id).first.present?
  end
end
