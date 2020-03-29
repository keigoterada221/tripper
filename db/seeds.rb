# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 都道府県データ
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

  Admin.create!(
    email: 'admin@admin',
    password: 'adminadmin',
    )

[
  [ '寺田圭吾', '09011111111', '1a@a1', 'aaaaaa'],
  [ 'ゴー！', '09022222222', '1b@b1', 'bbbbbb'],
  [ 'マイキー', '09033333333', '1c@c1', 'cccccc'],
  [ '日向翔陽', '09044444444', '1d@d1', 'dddddd'],
  [ '青井葦人', '09055555555', '1e@e1', 'eeeeee'],
  [ '飛信隊の信', '09066666666', '1f@f1', 'ffffff'],
  [ '土方歳三', '09077777777', '1g@g1', 'gggggg'],
  [ '井上尚弥', '09088888888', '1h@h1', 'hhhhhh'],
  [ '那須川天心', '09099999999', '1i@i1', 'iiiiii'],
  [ '錦織圭', '09010101010', '1j@j1', 'jjjjjj']
].each do |a, b, c, d|
  User.create!(
    [
      {
      name: a,
      phone_number: b,
      email: c,
      password: d,
      }
    ]
  )
end

[
  ['1','綺麗な街並み','海外のようでした！','千葉県','app/assets/videos/city.mp4','12'],
  ['2','淀川の花火','すごく賑わっていました！','大阪府淀川','app/assets/videos/hanabi.mp4','27'],
  ['3','趣のある観覧車','とても大きくて驚いた','宝塚市','app/assets/videos/kannrannsya.mp4','28'],
  ['4','綺麗な動画が撮れました！','シャッタースピードを落として撮りました','那覇市','app/assets/videos/soul.mp4','47'],
  ['5','五重塔','京都は何度行っても飽きません','河原町','app/assets/videos/kyoto.mp4','26'],
  ['6','大鳥居','下を潜りました！皆さんも是非！','厳島神社','app/assets/videos/miyazima.mp4','34'],
  ['7','満開の桜','お花見最高！','香川県','app/assets/videos/sakura.mp4','37'],
  ['8','満点の星空','空一面に広がった星を皆さんも是非！','美星町','app/assets/videos/star.mp4','33'],
  ['9','スキューバダイビング','やはり海は素晴らしい','沖縄県','app/assets/videos/sea.mp4','47'],
  ['10','福岡旅行','福岡の旅をまとめました','福岡県','app/assets/videos/kaigai.mp4','40']
].each do |a, b, c, d, e, f|
  Post.create!(
    [
      {
      user_id: a,
      title: b,
      body: c,
      destination: d,
      video: File.open(e),
      prefecture_id: f,
      }
    ]
  )
end