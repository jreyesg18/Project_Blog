class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_save :set_active

  scope :active, ->{ where active:true}

  belongs_to :user

  def set_active
    self.active = true
  end
end
