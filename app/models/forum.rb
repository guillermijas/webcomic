class Forum < ApplicationRecord
  belongs_to :comic
  has_many :groups, dependent: :destroy
end
