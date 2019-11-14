# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# addresses_seed
Address.create!(
  [
    {
      user_id: "1",
      delivery_name_family_kanji: "橋下",
      delivery_name_first_kanji: "三郎",
      delivery_name_family_furigana: "ハシモト",
      delivery_name_first_furigana: "サブロウ",
      delivery_postal_code: "0000000",
      delivery_address_prefecture: "北海道",
      delivery_address_city: "テスト市",
      delivery_address_number: "テスト3-3-3",
      delivery_address_building: "テストビル",
    },
    {
      user_id: "2",
      delivery_name_family_kanji: "高橋",
      delivery_name_first_kanji: "四郎",
      delivery_name_family_furigana: "タカハシ",
      delivery_name_first_furigana: "シロウ",
      delivery_postal_code: "1234567",
      delivery_address_prefecture: "北海道",
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
#arrivals_seed
Arrival.create!(
  [
    {
      item_id: '1',
      arrival_number: '1',
    },
    {
      item_id: '2',
      arrival_number: '2',
    }
  ]
)
#artists_seed
Artist.create!(
  [
    {
        artist_name: "歌手1",
    },
    {
        artist_name: "歌手2",
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
      user_id: "2",
      item_id: "2",
      cart_item_number: "1",
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
        text: "You're rock!! cancel that !!!!!!",
        reply_text: "reply to: You're rock!! cancel that !!!!!!",
    },
    {
        user_id: "2",
        category: "1",
        contact_status: "0",
        text: "You're rock!! cancel that !!!!!! WHAT A HELL",
        reply_text: "reply to: You're rock!! cancel that !!!!!! WHAT A HELL",
    }
  ]
)
#discs_seed
Disc.create!(
  [
    {
      item_id: '1',
      disc_name: 'disk1',
    },
    {
      item_id: '2',
      disc_name: 'disk2',
    }
  ]
)
#genres_seed
Genre.create!(
  [
    {
      genre_name: '洋楽',
    },
    {
      genre_name: '邦楽',
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
      item_name: 'CD名１',
      item_type: 'シングル',
      item_image_id: '',
      item_price: '1111',
      item_release_date: '2019/01/01',
      item_delete_flag: '0',
      item_view: '11111',
    },
    {
      artist_id: '2',
      label_id: '2',
      genre_id: '2',
      item_name: 'CD名２',
      item_type: 'アルバム',
      item_image_id: '',
      item_price: '2222',
      item_release_date: '2019/02/02',
      item_delete_flag: '0',
      item_view: '11111',
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
    }
  ]
)
#order_items_seed
OrderItem.create!(
  [
    {
      order_id: "1",
      item_id: "1",
      order_price: "2000",
      order_number: "1",
    },
    {
      order_id: "2",
      item_id: "2",
      order_price: "3000",
      order_number: "1",
    }
  ]
)
#orders_seed
Order.create!(
  [
    {
      user_id: "1",
      delivery_name_family_kanji: "橋下",
      delivery_name_first_kanji: "三郎",
      delivery_name_family_furigana: "ハシモト",
      delivery_name_first_furigana: "サブロウ",
      delivery_postal_code: "0000000",
      delivery_address_prefecture: "北海道",
      delivery_address_city: "テスト市",
      delivery_address_number: "テスト3-3-3",
      delivery_address_building: "テストビル",
      order_status: "0",
      total_fee: "2500",
      postage: "500",
    },
    {
      user_id: "1",
      delivery_name_family_kanji: "高橋",
      delivery_name_first_kanji: "四郎",
      delivery_name_family_furigana: "タカハシ",
      delivery_name_first_furigana: "シロウ",
      delivery_postal_code: "1234567",
      delivery_address_prefecture: "北海道",
      delivery_address_city: "DMM市",
      delivery_address_number: "DMM3-3-3",
      delivery_address_building: "DMM",
      order_status: "0",
      total_fee: "1500",
      postage: "500",
    }
  ]
)
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
        }
    ]
)
#songs_seed
Song.create!(
  [
    {
      disc_id: '1',
      song: 'カブトムシ',
    },
    {
      disc_id: '2',
      song: 'クワガタ',
    },
    {
      disc_id: '2',
      song: 'カタツムリ',
    },
    {
      disc_id: '1',
      song: 'カマキリ',
    }
  ]
)
#users_seed
User.create!(
  [
    {
      name_familry_kanji: "田中",
      name_first_kanji: "一郎",
      name_familry_furigana: "たなか",
      name_first_furigana: "いちろう",
      postal_code: "1234567",
      address_prefecture: "北海道",
      address_city: "テスト市",
      address_number: "テスト1-2-3",
      address_building: "テスト荘",
      phone_number: "09012345678",
      email: "test@gmail.com",
      password:  "11111111",
      delete_flag: "0",
    },
    {
      name_familry_kanji: "鈴木",
      name_first_kanji: "二郎",
      name_familry_furigana: "すずき",
      name_first_furigana: "じろう",
      postal_code: "7654321",
      address_prefecture: "神奈川県",
      address_city: "テスト市",
      address_number: "テスト11-11-11",
      address_building: "テストレジデンス",
      phone_number: "09043218765",
      email: "test2@gmail.com",
      password:  "22222222",
      delete_flag: "0",
    }
  ]
)