# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users_seed
User.create!(
  [
    {
      name_family_kanji: "田中",
      name_first_kanji: "角栄",
      name_family_furigana: "タナカ",
      name_first_furigana: "カクエイ",
      postal_code: "1234567",
      address_prefecture: "新潟県",
      address_city: "テスト市",
      address_number: "テスト1-2-3",
      address_building: "テスト荘",
      phone_number: "09012345678",
      email: "test@gmail.com",
      password:  "11111111",
      delete_flag: "0",
    },
    {
      name_family_kanji: "鈴木",
      name_first_kanji: "宗男",
      name_family_furigana: "スズキ",
      name_first_furigana: "ムネオ",
      postal_code: "7652321",
      address_prefecture: "北海道",
      address_city: "テスト市",
      address_number: "テスト11-11-11",
      address_building: "テストレジデンス",
      phone_number: "09043218765",
      email: "test2@gmail.com",
      password:  "22222222",
      delete_flag: "0",
    },
    {
      name_family_kanji: "竹下",
      name_first_kanji: "登",
      name_family_furigana: "タケシタ",
      name_first_furigana: "ノボル",
      postal_code: "7623451",
      address_prefecture: "島根県",
      address_city: "テスト市",
      address_number: "テスト11-11-11",
      address_building: "テストアパート",
      phone_number: "09011743713",
      email: "test3@gmail.com",
      password:  "33333333",
      delete_flag: "0",
    },
    {
      name_family_kanji: "小渕",
      name_first_kanji: "恵三",
      name_family_furigana: "オブチ",
      name_first_furigana: "ケイゾウ",
      postal_code: "3457651",
      address_prefecture: "群馬県",
      address_city: "テスト市",
      address_number: "テスト11-11-11",
      address_building: "テストレジデンス",
      phone_number: "09043898765",
      email: "test4@gmail.com",
      password:  "44444444",
      delete_flag: "0",
    },
    {
      name_family_kanji: "小泉",
      name_first_kanji: "純一郎",
      name_family_furigana: "コイズミ",
      name_first_furigana: "ジュンイチロウ",
      postal_code: "0987634",
      address_prefecture: "神奈川県",
      address_city: "テスト市",
      address_number: "テスト11-11-11",
      address_building: "テストレジデンス",
      phone_number: "08011711754",
      email: "test5@gmail.com",
      password:  "55555555",
      delete_flag: "0",
    }
  ]
)
#labels_seed
Label.create!(
  [
    {
        label_name: "ソニーミュージック",
    },
    {
        label_name: "カニーミュージック",
    },
    {
        label_name: "ポニーミュージック",
    },
    {
        label_name: "サニーミュージック",
    },
    {
        label_name: "マロニーミュージック",
    }
  ]
)
# addresses_seed
Address.create!(
  [
    {
      user_id: "2",
      delivery_name_family_kanji: "橋下",
      delivery_name_first_kanji: "徹",
      delivery_name_family_furigana: "ハシモト",
      delivery_name_first_furigana: "トオル",
      delivery_postal_code: "0000000",
      delivery_address_prefecture: "大阪府",
      delivery_address_city: "テスト市",
      delivery_address_number: "テスト3-3-3",
      delivery_address_building: "テストビル",
    },
    {
      user_id: "1",
      delivery_name_family_kanji: "田中",
      delivery_name_first_kanji: "眞紀子",
      delivery_name_family_furigana: "タナカ",
      delivery_name_first_furigana: "マキコ",
      delivery_postal_code: "13245347",
      delivery_address_prefecture: "新潟県",
      delivery_address_city: "DMM市",
      delivery_address_number: "DMM3-3-3",
      delivery_address_building: "DMM",
    },
    {
      user_id: "1",
      delivery_name_family_kanji: "麻生",
      delivery_name_first_kanji: "太郎",
      delivery_name_family_furigana: "アソウ",
      delivery_name_first_furigana: "タロウ",
      delivery_postal_code: "12987653",
      delivery_address_prefecture: "福岡県",
      delivery_address_city: "DMM市",
      delivery_address_number: "DMM3-3-3",
      delivery_address_building: "DMM",
    }
  ]
)
#admin_seed
Admin.create!(
             email: "admin@example.jp",
             password:  "11111111",
)


#genres_seed
Genre.create!(
  [
    {
      genre_name: '洋楽',
    },
    {
      genre_name: '邦楽',
    },
    {
      genre_name: '90年代',
    },
    {
      genre_name: '80年代',
    }
  ]
)

#artists_seed
Artist.create!(
  [
    {
        artist_name: "美空ひばり",
    },
    {
        artist_name: "宇多田ヒカル",
    },
    {
        artist_name: "五木ひろし",
    },
    {
        artist_name: "長渕剛",
    },
    {
        artist_name: "安室奈美恵",
    },
    {
        artist_name: "ZEDD",
    },
    {
        artist_name: "Alessia Cara",
    }
  ]
)
#items_seed
Item.create!(
  [
    {
      artist_id: '1',
      label_id: '1',
      genre_id: '1',
      item_name: 'ひばりジャズを歌う',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '1111',
      item_release_date: '1998/10/21',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '2',
      label_id: '2',
      genre_id: '2',
      item_name: 'Distance',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '2222',
      item_release_date: '2001/03/28',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '2',
      label_id: '2',
      genre_id: '2',
      item_name: 'DEEP RIVER',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '3333',
      item_release_date: '2002/06/19',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '2',
      label_id: '2',
      genre_id: '2',
      item_name: 'ULTRA BLUE',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '4444',
      item_release_date: '2006/06/14',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '2',
      label_id: '2',
      genre_id: '2',
      item_name: 'HEART STATION',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '5555',
      item_release_date: '2008/03/19',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '3',
      label_id: '3',
      genre_id: '2',
      item_name: '麗しきボサノヴァ/和み酒',
      item_type: 'シングル',
      item_image_id: '',
      item_price: '5555',
      item_release_date: '2019/07/10',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '3',
      label_id: '3',
      genre_id: '2',
      item_name: 'わすれ宿/のぞみ(希望)',
      item_type: 'シングル',
      item_image_id: '',
      item_price: '2500',
      item_release_date: '2017/08/23',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '4',
      label_id: '2',
      genre_id: '2',
      item_name: 'ふざけんじゃねぇ',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '3204',
      item_release_date: '1997/09/03',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '4',
      label_id: '2',
      genre_id: '2',
      item_name: 'しあわせになろうよ',
      item_type: 'シングル',
      item_image_id: '',
      item_price: '1100',
      item_release_date: '2003/05/01',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '4',
      label_id: '2',
      genre_id: '2',
      item_name: '走る',
      item_type: 'シングル',
      item_image_id: '',
      item_price: '1324',
      item_release_date: '2017/08/23',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '4',
      label_id: '2',
      genre_id: '2',
      item_name: 'LICENCE',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '2937',
      item_release_date: '2006/02/08',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '2',
      label_id: '1',
      genre_id: '2',
      item_name: 'ぼくはくま',
      item_type: 'シングル',
      item_image_id: '',
      item_price: '650',
      item_release_date: '2006/11/22',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '5',
      label_id: '1',
      genre_id: '2',
      item_name: 'NEVER END',
      item_type: 'シングル',
      item_image_id: '',
      item_price: '1100',
      item_release_date: '2000/07/12',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '5',
      label_id: '1',
      genre_id: '2',
      item_name: 'GIRL TALK / the SPEED STAR',
      item_type: 'シングル',
      item_image_id: '',
      item_price: '1100',
      item_release_date: '2004/10/14',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '6',
      label_id: '5',
      genre_id: '1',
      item_name: 'STAY +',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '2420',
      item_release_date: '2017/12/27',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '6',
      label_id: '5',
      genre_id: '1',
      item_name: 'TRUE COLORS',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '2695',
      item_release_date: '2015/12/30',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '7',
      label_id: '5',
      genre_id: '1',
      item_name: 'Pains Of Growing',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '2222',
      item_release_date: '2018/11/30',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '7',
      label_id: '5',
      genre_id: '1',
      item_name: 'This Summer -EP-',
      item_type: 'EP',
      item_image_id: '',
      item_price: '2000',
      item_release_date: '2019/09/06',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '7',
      label_id: '5',
      genre_id: '1',
      item_name: 'KNOW-IT-ALL',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '2100',
      item_release_date: '2017/02/08',
      impressions_count: '0',
      item_delete_flag: 0,
    },
    {
      artist_id: '2',
      label_id: '3',
      genre_id: '2',
      item_name: 'Face My Fears',
      item_type: 'シングル',
      item_image_id: '',
      item_price: '1400',
      item_release_date: '2019/01/18',
      impressions_count: '0',
      item_delete_flag: 0,
    }
  ]
)

#contacts_seed
Contact.create!(
  [
    {
        user_id: "1",
        category: "0",
        contact_status: "0",
        text: "こんにちは",
        reply_text: "さようならいおん",
    },
    {
        user_id: "2",
        category: "1",
        contact_status: "0",
        text: "おはよう",
        reply_text: "おはよううさぎ",
    }
  ]
)

#arrivals_seed
Arrival.create!(
  [
    {
      item_id: '1',
      arrival_number: '1',
      arrival_date: '2017-11-14',
    },
    {
      item_id: '2',
      arrival_number: '2',
      arrival_date: '2018-11-14',
    },
    {
      item_id: '3',
      arrival_number: '1',
      arrival_date: '2018-11-14',
    },
    {
      item_id: '4',
      arrival_number: '2',
      arrival_date: '2018-11-14',
    },
    {
      item_id: '1',
      arrival_number: '1',
      arrival_date: '2018-12-14',
    },
    {
      item_id: '2',
      arrival_number: '2',
      arrival_date: '2019-11-14',
    }
  ]
)
Order.create!(
  [
    {
      user_id: "1",
      delivery_name_family_kanji: "橋下",
      delivery_name_first_kanji: "徹",
      delivery_name_family_furigana: "ハシモト",
      delivery_name_first_furigana: "トオル",
      delivery_postal_code: "0000000",
      delivery_address_prefecture: "北海道",
      delivery_address_city: "テスト市",
      delivery_address_number: "テスト3-3-3",
      delivery_address_building: "テストビル",
      order_status: 0,
      total_fee: "2500",
      postage: "500",
    },
    {
      user_id: "1",
      delivery_name_family_kanji: "高橋",
      delivery_name_first_kanji: "克実",
      delivery_name_family_furigana: "タカハシ",
      delivery_name_first_furigana: "カツミ",
      delivery_postal_code: "1234567",
      delivery_address_prefecture: "北海道",
      delivery_address_city: "DMM市",
      delivery_address_number: "DMM3-3-3",
      delivery_address_building: "DMM",
      order_status: 0,
      total_fee: "1500",
      postage: "500",
    },
    {
      user_id: "2",
      delivery_name_family_kanji: "小沢",
      delivery_name_first_kanji: "一郎",
      delivery_name_family_furigana: "オザワ",
      delivery_name_first_furigana: "イチロウ",
      delivery_postal_code: "1233443",
      delivery_address_prefecture: "東京都",
      delivery_address_city: "DMM市",
      delivery_address_number: "DMM3-3-3",
      delivery_address_building: "DMM",
      order_status: 0,
      total_fee: "1500",
      postage: "500",
    },
    {
      user_id: "3",
      delivery_name_family_kanji: "鳩山",
      delivery_name_first_kanji: "由紀夫",
      delivery_name_family_furigana: "ハトヤマ",
      delivery_name_first_furigana: "ユキオ",
      delivery_postal_code: "1234567",
      delivery_address_prefecture: "東京都",
      delivery_address_city: "DMM市",
      delivery_address_number: "DMM1-3-3",
      delivery_address_building: "DMM",
      order_status: 0,
      total_fee: "1500",
      postage: "500",
    },
    {
      user_id: "4",
      delivery_name_family_kanji: "野田",
      delivery_name_first_kanji: "佳彦",
      delivery_name_family_furigana: "ノダ",
      delivery_name_first_furigana: "ヨシヒコ",
      delivery_postal_code: "1234347",
      delivery_address_prefecture: "千葉県",
      delivery_address_city: "DMM市",
      delivery_address_number: "DMM3-3-4",
      delivery_address_building: "DMM",
      order_status: 0,
      total_fee: "11000",
      postage: "500",
    },
  ]
)
#order_items_seed
OrderItem.create!(
  [
    {
      order_id: "1",
      item_id: "1",
      order_price: "2000",
      order_number: "10",
    },
    {
      order_id: "2",
      item_id: "2",
      order_price: "3000",
      order_number: "1",
    },
    {
      order_id: "2",
      item_id: "3",
      order_price: "3000",
      order_number: "3",
    },
    {
      order_id: "3",
      item_id: "4",
      order_price: "3000",
      order_number: "2",
    },
    {
      order_id: "3",
      item_id: "9",
      order_price: "3000",
      order_number: "2",
    },
    {
      order_id: "4",
      item_id: "15",
      order_price: "3000",
      order_number: "2",
    },
  ]
)
>>>>>>> develop
#reviews_seed
Review.create!(
    [
        {
            user_id: "1",
            item_id: "1",
            review_title: "良かったよーん",
            review_content: "感動しすぎて頭がおかしくなりました。とてもいい曲です",
            satisfaction: "5",
        },
        {
            user_id: "2",
            item_id: "2",
            review_title: "悪かったよーん",
            review_content: "うるさすぎて頭がおかしくなりました。とてもわるい曲です",
            satisfaction: "1",
        },
        {
            user_id: "2",
            item_id: "1",
            review_title: "まあまあだよーん",
            review_content: "まあまあで頭がおかしくなりました。とてもかるい曲です",
            satisfaction: "3",
        },
        {
            user_id: "3",
            item_id: "1",
            review_title: "いいんでねえか",
            review_content: "いい曲でした",
            satisfaction: "4",
        },
        {
            user_id: "4",
            item_id: "1",
            review_title: "だめだこりゃ",
            review_content: "だめでした",
            satisfaction: "2",
        }
    ]
)
#discs_seed
Disc.create!(
  [
    {
      item_id: '1',
      disc_name: 'Disk1',
    },
    {
      item_id: '2',
      disc_name: 'Disk1',
    },
    {
      item_id: '3',
      disc_name: 'Disk1',
    },
    {
      item_id: '1',
      disc_name: 'Disk2',
    },
    {
      item_id: '4',
      disc_name: 'Disk1',
    },
    {
      item_id: '5',
      disc_name: 'Disk1',
    },
    {
      item_id: '6',
      disc_name: 'Disk1',
    },
    {
      item_id: '7',
      disc_name: 'Disk1',
    },
    {
      item_id: '8',
      disc_name: 'Disk1',
    },
    {
      item_id: '9',
      disc_name: 'Disk1',
    },
    {
      item_id: '10',
      disc_name: 'Disk1',
    },
    {
      item_id: '11',
      disc_name: 'Disk1',
    },
    {
      item_id: '12',
      disc_name: 'Disk1',
    },
    {
      item_id: '13',
      disc_name: 'Disk1',
    },
    {
      item_id: '14',
      disc_name: 'Disk1',
    },
    {
      item_id: '15',
      disc_name: 'Disk1',
    },
    {
      item_id: '16',
      disc_name: 'Disk1',
    },
    {
      item_id: '17',
      disc_name: 'Disk1',
    },
    {
      item_id: '18',
      disc_name: 'Disk1',
    },
    {
      item_id: '19',
      disc_name: 'Disk1',
    },
    {
      item_id: '20',
      disc_name: 'Disk1',
    }
  ]
)
#songs_seed
Song.create!(
  [
    {
      disc_id: '1',
      song: 'スターダスト',
    },
    {
      disc_id: '1',
      song: 'ラヴ',
    },
    {
      disc_id: '1',
      song: '魅惑のワルツ',
    },
    {
      disc_id: '1',
      song: '歩いて帰ろう',
    },
    {
      disc_id: '1',
      song: 'トゥ・ヤング',
    },
    {
      disc_id: '1',
      song: 'ペイパー・ムーン',
    },
    {
      disc_id: '4',
      song: '恋人よ我に帰れ',
    },
    {
      disc_id: '4',
      song: 'プリテンド',
    },
    {
      disc_id: '4',
      song: '月光価千金',
    },
    {
      disc_id: '4',
      song: '慕情',
    },
    {
      disc_id: '4',
      song: 'ロンリー・ワン',
    },
    {
      disc_id: '4',
      song: '夕日に赤い帆',
    },
    {
      disc_id: '2',
      song: 'Wait & See ～リスク～',
    },
    {
      disc_id: '2',
      song: 'Can You Keep A Secret?',
    },
    {
      disc_id: '2',
      song: 'DISTANCE',
    },
    {
      disc_id: '2',
      song: 'サングラス',
    },
    {
      disc_id: '2',
      song: 'ドラマ',
    },
    {
      disc_id: '2',
      song: 'Eternally',
    },
    {
      disc_id: '2',
      song: 'Addicted To You [UP-IN-HEAVEN MIX]',
    },
    {
      disc_id: '2',
      song: 'For You',
    },
    {
      disc_id: '2',
      song: '蹴っ飛ばせ!',
    },
    {
      disc_id: '2',
      song: 'Parody',
    },
    {
      disc_id: '2',
      song: 'タイム・リミット',
    },
    {
      disc_id: '2',
      song: '言葉にならない気持ち',
    },
    {
      disc_id: '2',
      song: 'HAYATOCHI-REMIX (Bonus Track)',
    },
    {
      disc_id: '3',
      song: 'SAKURAドロップス',
    },
    {
      disc_id: '3',
      song: 'traveling',
    },
    {
      disc_id: '3',
      song: '幸せになろう',
    },
    {
      disc_id: '3',
      song: 'Deep River',
    },
    {
      disc_id: '3',
      song: 'Letters',
    },
    {
      disc_id: '3',
      song: 'プレイ・ボール',
    },
    {
      disc_id: '3',
      song: '東京NIGHTS',
    },
    {
      disc_id: '3',
      song: 'A.S.A.P.',
    },
    {
      disc_id: '3',
      song: '嘘みたいな I Love You',
    },
    {
      disc_id: '3',
      song: 'FINAL DISTANCE',
    },
    {
      disc_id: '3',
      song: 'Bridge (Interlude)',
    },
    {
      disc_id: '3',
      song: '光',
    },
    {
      disc_id: '5',
      song: 'This Is Love',
    },
    {
      disc_id: '5',
      song: 'Keep Tryin',
    },
    {
      disc_id: '5',
      song: 'BLUE',
    },
    {
      disc_id: '5',
      song: '日曜の朝',
    },
    {
      disc_id: '5',
      song: 'Making Love',
    },
    {
      disc_id: '5',
      song: '誰かの願いが叶うころ',
    },
    {
      disc_id: '5',
      song: 'COLORS',
    },
    {
      disc_id: '5',
      song: 'One Night Magic feat. Yamada Masashi',
    },
    {
      disc_id: '5',
      song: '海路',
    },
    {
      disc_id: '5',
      song: 'WINGS',
    },
    {
      disc_id: '5',
      song: 'Be My Last',
    },
    {
      disc_id: '5',
      song: 'Eclipse (Interlude)',
    },
    {
      disc_id: '5',
      song: 'Passion',
    },
    {
      disc_id: '6',
      song: 'Fight The Blues',
    },
    {
      disc_id: '6',
      song: 'HEART STATION',
    },
    {
      disc_id: '6',
      song: 'Beautiful World',
    },
    {
      disc_id: '6',
      song: 'Flavor Of Life -Ballad Version-',
    },
    {
      disc_id: '6',
      song: 'Stay Gold',
    },
    {
      disc_id: '6',
      song: 'Kiss & Cry',
    },
    {
      disc_id: '6',
      song: 'Gentle Beast Interlude',
    },
    {
      disc_id: '6',
      song: 'Celebrate',
    },
    {
      disc_id: '6',
      song: 'Prisoner Of Love',
    },
    {
      disc_id: '6',
      song: 'テイク 5',
    },
    {
      disc_id: '6',
      song: 'ぼくはくま',
    },
    {
      disc_id: '6',
      song: '虹色バス',
    },
    {
      disc_id: '6',
      song: 'Flavor Of Life(Bonus Track)',
    },
    {
      disc_id: '7',
      song: '麗しきボサノヴァ',
    },
    {
      disc_id: '7',
      song: '和み酒',
    },
    {
      disc_id: '7',
      song: '麗しきボサノヴァ (オリジナルカラオケ)',
    },
    {
      disc_id: '7',
      song: '和み酒 (オリジナルカラオケ)',
    },
    {
      disc_id: '8',
      song: 'わすれ宿',
    },
    {
      disc_id: '8',
      song: 'のぞみ(希望)',
    },
    {
      disc_id: '8',
      song: '男の友情',
    },
    {
      disc_id: '8',
      song: 'わすれ宿 (オリジナルカラオケ)',
    },
    {
      disc_id: '8',
      song: 'のぞみ(希望) (オリジナルカラオケ)',
    },
    {
      disc_id: '8',
      song: '男の友情 (オリジナルカラオケ)',
    },
    {
      disc_id: '9',
      song: 'いのち',
    },
    {
      disc_id: '9',
      song: '上を向いて歩こう',
    },
    {
      disc_id: '9',
      song: '英二',
    },
    {
      disc_id: '9',
      song: 'ひまわり',
    },
    {
      disc_id: '9',
      song: 'かりそめの夜の海',
    },
    {
      disc_id: '9',
      song: 'あなたとわたしの物語',
    },
    {
      disc_id: '9',
      song: 'しあわせの小さな庭',
    },
    {
      disc_id: '9',
      song: '金色に輝け２０年',
    },
    {
      disc_id: '9',
      song: 'ふざけんじゃねぇ',
    },
    {
      disc_id: '9',
      song: '涙は大切な君の友達だから',
    },
    {
      disc_id: '10',
      song: 'しあわせになろうよ',
    },
    {
      disc_id: '10',
      song: 'しあわせになろうよ（アカペラ・バージョン)',
    },
    {
      disc_id: '10',
      song: 'しあわせになろうよ（オリジナル・カラオケ)',
    },
    {
      disc_id: '11',
      song: '走る',
    },
    {
      disc_id: '11',
      song: 'YOU CHANGED YOUR MIND 2014',
    },
    {
      disc_id: '11',
      song: '走る (instrumental)',
    },
    {
      disc_id: '11',
      song: 'YOU CHANGED YOUR MIND 2014 (instrumental)',
    },
    {
      disc_id: '12',
      song: '泣いてチンピラ',
    },
    {
      disc_id: '12',
      song: 'PLEASE AGEIN',
    },
    {
      disc_id: '12',
      song: 'パークハウス 701 in 1985',
    },
    {
      disc_id: '12',
      song: 'ろくなもんじゃねぇ',
    },
    {
      disc_id: '12',
      song: 'He・la-He・la',
    },
    {
      disc_id: '12',
      song: 'SITTING IN THE RAIN',
    },
    {
      disc_id: '12',
      song: '花菱にて',
    },
    {
      disc_id: '12',
      song: 'LICENSE',
    },
    {
      disc_id: '12',
      song: '何の矛盾もない',
    },
    {
      disc_id: '13',
      song: 'ぼくはくま',
    },
    {
      disc_id: '13',
      song: 'ぼくはくま (オリジナル･カラオケ)',
    },
    {
      disc_id: '14',
      song: 'NEVER　END (Radio Edit)',
    },
    {
      disc_id: '14',
      song: 'NEVER　END (Original Mix)',
    },
    {
      disc_id: '14',
      song: 'NEVER　END (Chanpuru Mix)',
    },
    {
      disc_id: '14',
      song: 'NEVER　END (Acappella)',
    },
    {
      disc_id: '15',
      song: 'GIRL TALK',
    },
    {
      disc_id: '15',
      song: 'the SPEED STAR',
    },
    {
      disc_id: '15',
      song: 'GIRL TALK (Instrumental)',
    },
    {
      disc_id: '15',
      song: 'the SPEED STAR (Instrumental)',
    },
    {
      disc_id: '16',
      song: 'Stay',
    },
    {
      disc_id: '16',
      song: 'Get Low',
    },
    {
      disc_id: '16',
      song: 'Break Free',
    },
    {
      disc_id: '16',
      song: 'Beautiful Now',
    },
    {
      disc_id: '16',
      song: 'Candyman',
    },
    {
      disc_id: '16',
      song: 'Adrenaline',
    },
    {
      disc_id: '16',
      song: 'Ignite',
    },
    {
      disc_id: '16',
      song: 'Starving',
    },
    {
      disc_id: '16',
      song: 'Stay (Yasutaka Nakata Remix)',
    },
    {
      disc_id: '16',
      song: 'Get Low (KUURO Remix)',
    },
    {
      disc_id: '16',
      song: 'Let Me Love You (Zedd Remix)',
    },
    {
      disc_id: '16',
      song: 'Zedd Mega Nonstop Mix',
    },
    {
      disc_id: '17',
      song: 'Addicted To A Memory',
    },
    {
      disc_id: '17',
      song: 'I Want You To Know',
    },
    {
      disc_id: '17',
      song: 'Beautiful Now',
    },
    {
      disc_id: '17',
      song: 'Transmission',
    },
    {
      disc_id: '17',
      song: 'Done With Love',
    },
    {
      disc_id: '17',
      song: 'True Colors',
    },
    {
      disc_id: '17',
      song: 'Straight Into The Fire',
    },
    {
      disc_id: '17',
      song: 'Papercut',
    },
    {
      disc_id: '17',
      song: 'Bumble Bee',
    },
    {
      disc_id: '17',
      song: 'Daisy',
    },
    {
      disc_id: '17',
      song: 'Illusion',
    },
    {
      disc_id: '18',
      song: 'Growing Pains',
    },
    {
      disc_id: '18',
      song: 'Not Today',
    },
    {
      disc_id: '18',
      song: 'I Dont Want To',
    },
    {
      disc_id: '18',
      song: '7 Days',
    },
    {
      disc_id: '18',
      song: 'Trust My Lonely',
    },
    {
      disc_id: '18',
      song: 'Wherever I Live',
    },
    {
      disc_id: '18',
      song: 'All We Know',
    },
    {
      disc_id: '18',
      song: 'A Little More',
    },
    {
      disc_id: '18',
      song: 'Comfortable',
    },
    {
      disc_id: '18',
      song: 'Nintendo Game',
    },
    {
      disc_id: '18',
      song: 'Out Of Love',
    },
    {
      disc_id: '18',
      song: 'Girl Next Door',
    },
    {
      disc_id: '18',
      song: 'My Kind',
    },
    {
      disc_id: '18',
      song: 'Easier Said',
    },
    {
      disc_id: '18',
      song: 'Growing Pains (Reprise)',
    },
    {
      disc_id: '19',
      song: 'Ready',
    },
    {
      disc_id: '19',
      song: 'Whats On Your Mind?',
    },
    {
      disc_id: '19',
      song: 'Like You',
    },
    {
      disc_id: '19',
      song: 'OKAY OKAY',
    },
    {
      disc_id: '19',
      song: 'Rooting For You',
    },
    {
      disc_id: '19',
      song: 'October',
    },
    {
      disc_id: '20',
      song: 'Seventeen',
    },
    {
      disc_id: '20',
      song: 'Here',
    },
    {
      disc_id: '20',
      song: 'Outlaws',
    },
    {
      disc_id: '20',
      song: 'I`m Yours',
    },
    {
      disc_id: '20',
      song: 'Four Pink Walls',
    },
    {
      disc_id: '20',
      song: 'Wild Things',
    },
    {
      disc_id: '20',
      song: 'Stone',
    },
    {
      disc_id: '20',
      song: 'Overdose',
    },
    {
      disc_id: '20',
      song: 'Stars',
    },
    {
      disc_id: '20',
      song: 'Scars To Your Beautiful',
    },
    {
      disc_id: '21',
      song: 'Face My Fears (Japanese Version)',
    },
    {
      disc_id: '21',
      song: '誓い',
    },
    {
      disc_id: '21',
      song: 'Face My Fears (English Version)',
    },
    {
      disc_id: '21',
      song: 'Don`t Think Twice',
    }
  ]
)



#carts_seed
Cart.create!(
  [
    {
      user_id: "1",
      item_id: "1",
      cart_item_number: "1",
    },
    {
      user_id: "1",
      item_id: "2",
      cart_item_number: "2",
    },
    {
      user_id: "2",
      item_id: "2",
      cart_item_number: "2",
    }
  ]
)