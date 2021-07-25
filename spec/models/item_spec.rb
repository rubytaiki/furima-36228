require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = Item.new(
      item_name: "The map",
      description: "It's a world map that I love most",
      price: 2000,
      category_id: 2,
      status_id: 2,
      prefecture_id: 2,
      charge_id: 2,
      shippingDate_id: 2
    )
    @item.image.attach(io: File.open('app/assets/images/893352925-28144059336.jpg'), filename: '893352925-28144059336.jpg')
  end

  describe '#create' do
    context '新規登録できるとき' do
      it 'imgae,item_name,description,price,category,status,prefecture,charge,sihppingDate,全て存在すれば登録できる。' do
        expect(@item).to be_valid
      end

      it '値段が¥300~¥9999999であるかつ、半角数字であれぼ登録できる' do
        @item.price = 301
        expect(@item).to be_valid
      end

    end

    context '新規登録できないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品名が40字以下であること' do
        @item.item_name = 'あ' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
      end
      
      it '商品の説明が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '商品説明が1000字以下であること' do
        @item.description = 'あ' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '配送料の負担の情報が必須であること' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '発送元の地域の情報が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が必須であること' do
        @item.shippingDate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingdate can't be blank")
      end
      it '価格の情報が必須であること' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '価格は、~¥9,999,999まで保存可能であること' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格は、¥300~のみ保存可能であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格は半角数値のみ保存可能であること' do
        @item.price = '２２２'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
