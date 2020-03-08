# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  [ '山田', '1231111', '宝塚市','安倉', 'abc@ab', 'aaaaaa', '09011112222'],
  [ '渡辺',  '1232222', '伊丹市','荒牧', 'abc@bb', 'bbbbbb', '09033334444'],
  [ '田中',  '1233333', '尼崎市','難波', 'abc@cb', 'cccccc', '09055556666'],
  [ '鈴木', '1234444', '西宮市','緑ヶ丘', 'abc@db', 'dddddd', '09077778888']
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
  ['1','琵琶湖の花火','すごく綺麗'],
  ['2','淀川の花火','音がでかかった'],
  ['3','みなと神戸の花火','賑わってた'],
  ['4','田舎の花火','最高だーーーー']
].each do |a, b, c|
  Post.create!(
    [
      {
      user_id: a,
      title: b,
      body: c,
      }
    ]
  )
end