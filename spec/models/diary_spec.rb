require 'rails_helper'

RSpec.describe Diary, type: :model do
  context "Diaryが正しく登録される" do
    before do
      @diary = Diary.new
      @diary.artist_name = "バンド"
      @diary.live_name = "ツアー"
      @diary.title = "タイトル"
      @diary.setlist = "セットリスト"
      @diary.place = "場所"
      @diary.impression = "感想"
      @diary.date = "2020/4/2"
      @diary.save
    end
    it "全て入力してあるので保存される" do
      expect(@diary).to be_valid
    end
  end
end


