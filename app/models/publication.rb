class Publication < ApplicationRecord
  belongs_to :comic

  has_attached_file :attachment, styles: { medium:'300x300>', thumb: '100x100>' }
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/

  def next
    Publication.where(comic_id: comic_id).where('id > ?', id).first
  end

  def previous
    Publication.where(comic_id: comic_id).where('id < ?', id).last
  end
end
