class Micropost < ApplicationRecord
  belongs_to :user
  #投稿を最新順にする
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true,length:{maximum:300}
  mount_uploader :picture, PictureUploader
  validate  :picture_size
  
  private

  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
