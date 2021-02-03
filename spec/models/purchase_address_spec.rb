require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入記録保存' do
    before do
      @purchase = FactoryBot.build(:purchase_address)
    end

    context '正常系' do
      it 'トークンがあれば保存できる' do
        @purchase.token = 'tok_1234567890abcdefghijk'
        expect(@purchase).to be_valid
      end

      it '郵便番号が3桁+ハイフン+4桁であれば保存できる' do
        @purchase.zip_code = '123-4567'
        expect(@purchase).to be_valid
      end

      it '都道府県idが1以外であれば保存できる' do
        @purchase.pref_id = 2
        expect(@purchase).to be_valid
      end

      it '市区町村があれば保存できる' do
        @purchase.city = '名古屋市'
        expect(@purchase).to be_valid
      end

      it '番地があれば保存できる' do
        @purchase.chome = '1丁目2-3'
        expect(@purchase).to be_valid
      end

      it '建物名があってもなくても保存できる' do
        @purchase.bldg = ''
        expect(@purchase).to be_valid
        @purchase.bldg = '〇〇ビルディング'
        expect(@purchase).to be_valid
      end

      it '電話番号がハイフンなしの11桁以内であれば保存できる' do
        @purchase.tel = '09012345678'
        expect(@purchase).to be_valid
      end
    end

    context '異常系' do
      it 'トークンが空だと保存できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Token can't be blank"
      end

      it '郵便番号が空だと保存できない' do
        @purchase.zip_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Zip code can't be blank"
      end

      it '郵便番号にハイフンがないと保存できない' do
        @purchase.zip_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include 'Zip code is invalid'
      end

      it '郵便番号が全角だと保存できない' do
        @purchase.zip_code = '１２３−４５６７'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include 'Zip code is invalid'
      end

      it '都道府県idが1だと保存できない' do
        @purchase.pref_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include 'Pref must be other than 1'
      end

      it '都道府県idが空だと保存できない' do
        @purchase.pref_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Pref can't be blank"
      end

      it '市区町村が空だと保存できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "City can't be blank"
      end

      it '番地が空だと保存できない' do
        @purchase.chome = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Chome can't be blank"
      end

      it '電話番号が空だと保存できない' do
        @purchase.tel = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Tel can't be blank"
      end

      it '電話番号が11桁以上だと保存できない' do
        @purchase.tel = '090123456789'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include 'Tel is invalid'
      end

      it '電話番号が全角数字だと保存できない' do
        @purchase.tel = '０９０１２３４５６７８'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include 'Tel is invalid'
      end

      it '電話番号にハイフンがあると保存できない' do
        @purchase.tel = '090-1234-5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include 'Tel is invalid'
      end
    end
  end
end
