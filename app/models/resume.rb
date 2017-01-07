class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :work
  mount_uploader :attachment, AttachmentUploader
  validates :content, presence: true
end
