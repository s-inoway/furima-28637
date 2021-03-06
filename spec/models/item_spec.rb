require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
      @item.image = fixture_file_upload('app/assets/images/sample1.jpg')
    end

    context '正常系' do
      it '全て正常に入力・選択されていると出品できる' do
        expect(@item).to be_valid
      end

      it '商品のカテゴリーが(---)以外だと出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it '商品の状態が(---)以外だと出品できる' do
        @item.condition_id = 2
        expect(@item).to be_valid
      end

      it '配送料の負担が(---)以外だと出品できる' do
        @item.carriage_id = 2
        expect(@item).to be_valid
      end

      it '発送元地域が(---)以外だと出品できる' do
        @item.pref_id = 2
        expect(@item).to be_valid
      end

      it '発送までの日数が(---)以外だと出品できる' do
        @item.ship_date_id = 2
        expect(@item).to be_valid
      end

      it '価格が300円以上〜9,999,999円以下だと出品できる' do
        @item.price = 300
        expect(@item).to be_valid
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '異常系' do
      it '画像が無いと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が無いと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品の説明が無いと出品できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Comment can't be blank"
      end

      it '商品のカテゴリーが(---)だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end

      it '商品のカテゴリーが無いと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が(---)だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 1'
      end

      it '商品の状態が無いと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it '配送料の負担が(---)だと出品できない' do
        @item.carriage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Carriage must be other than 1'
      end

      it '配送料の負担が無いと出品できない' do
        @item.carriage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Carriage can't be blank"
      end

      it '発送元の地域が(---)だと出品できない' do
        @item.pref_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Pref must be other than 1'
      end

      it '発送元の地域が無いと出品できない' do
        @item.pref_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Pref can't be blank"
      end

      it '発送までの日数が(---)だと出品できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Ship date must be other than 1'
      end

      it '発送までの日数が無いと出品できない' do
        @item.ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship date can't be blank"
      end

      it '価格が無いと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が300円より小さいと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it '価格が10,000,000円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end

      it '価格が全角数字だと出品できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end
