# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
require 'zip'
DLURL           = "http://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip"
SAVEDIR         = "db/"
CSVROW_PREFNAME = 6

savePath = ""
# 都道府県のCSVダウンロード、解答し保存
open(URI.escape(DLURL)) do |file|
  ::Zip::File.open_buffer(file.read) do |zf|
    zf.each do |entry|
      savePath = SAVEDIR + entry.name
      zf.extract(entry, savePath) { true }
    end
  end
end
# 都道府県のCSVを読み込んでDBに保存
CSV.foreach(savePath, encoding: "Shift_JIS:UTF-8") do |row|
  prefName = row[CSVROW_PREFNAME]
  Prefecture.find_or_create_by(:name => prefName)
end
# 保存後に削除
File.unlink savePath


[
  [ '山田', '1231111', '宝塚市','安倉', 'a@a', 'aaaaaa', '09011112222'],
  [ '渡辺',  '1232222', '伊丹市','荒牧', 'b@b', 'bbbbbb', '09033334444'],
  [ '田中',  '1233333', '尼崎市','難波', 'c@c', 'cccccc', '09055556666'],
  [ '鈴木', '1234444', '西宮市','緑ヶ丘', 'd@d', 'dddddd', '09077778888']
].each do |a, b, c, d, e, f, g|
  User.create!(
    [
      {
      name: a,
      post_code: b,
      address_city: c,
      address_street: d,
      email: e,
      password: f,
      phone_number: g,
      }
    ]
  )
end

[
  ['1','琵琶湖の花火','すごく綺麗','app/assets/videos/city.mp4','27'],
  ['2','淀川の花火','音がでかかった','app/assets/videos/hanabi.mp4','28'],
  ['3','みなと神戸の花火','賑わってた','app/assets/videos/kannrannsya.mp4','29'],
  ['4','田舎の花火','最高だーーーー','app/assets/videos/soul.mp4','30']
].each do |a, b, c, d, e|
  Post.create!(
    [
      {
      user_id: a,
      title: b,
      body: c,
      video: File.open(d),
      prefecture_id: e,
      }
    ]
  )
end