class Diary < ApplicationRecord
	belongs_to :user
	attachment :live_image
	has_many :comment, dependent: :destroy
	has_many :favorites, dependent: :destroy

  validates :artist_name, presence:true
  validates :live_name, presence:true
  validates :title, presence:true
  validates :impression, presence:true
  validates :date, presence:true
  validates :setlist, presence:true
  validates :place, presence:true


	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

  def self.search(search) #self.でクラスメソッドとしている
    search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
    Diary.where(['artist_name LIKE ? OR live_name LIKE ? OR place LIKE ? ', "%#{search}%", "%#{search}%", "%#{search}%"])

  end

  acts_as_taggable

  paginates_per 10
end



