class Photo < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :apply
end
