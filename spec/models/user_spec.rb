require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    before do
      @user = FactoryBot.build(:user)
    end

    context '正常系' do
      it "ニックネームがあれば登録できる" do
        @user.nickname = "ニックネーム"
        expect(@user).to be_valid
      end

      it "@を含むメールアドレスであれば登録できる" do
        @user.email = "mailaddress@gmail.com"
        expect(@user).to be_valid
      end

      it "6文字以上の英数字混合パスワードが、確認用含め2回入力すれば登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end

      it "ユーザー本名（名字と名前）が全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = "テスト"
        @user.last_name = "太郎"
        expect(@user).to be_valid
      end

      it "ユーザー本名のフリガナが、全角（カタカナ）であれば登録できる" do
        @user.first_name_furigana = "テスト"
        @user.last_name_furigana = "タロウ"
        expect(@user).to be_valid
      end

      it "生年月日があれば登録できる" do
        @user.birthday = "2000-01-01"
        expect(@user).to be_valid
      end

    end

    context '異常系' do
      it "ニックネームが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "メールアドレスが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "メールアドレスが重複していると登録できない" do
        @user.save
        other_user = FactoryBot.build(:user)
        other_user.email = @user.email
        other_user.valid?
        expect(other_user.errors.full_messages).to include "Email has already been taken"
      end

      it "メールアドレスに@が含まれていないと登録できない" do
        @user.email = "mailaddressgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it "パスワードが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "パスワードが6文字より少ないと登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "パスワードは英字のみだと登録できない" do
        @user.password = "abcdefgh"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it "パスワードが数字のみだと登録できない" do
        @user.password = "12345678"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it "確認用パスワードが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
      end

      it "パスワードが確認用と一致しないと登録できない" do
        @user.password = "abc123"
        @user.password_confirmation = "xyz789"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "ユーザー本名（名字）が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it "ユーザー本名（名前）が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it "ユーザー本名が半角（英数字）だと登録できない（名字）" do
        @user.first_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it "ユーザー本名が半角（英数字）だと登録できない（名前）" do
        @user.last_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it "ユーザー本名のフリガナが、空だと登録できない（名字）" do
        @user.first_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name furigana can't be blank"
      end

      it "ユーザー本名のフリガナが、空だと登録できない（名前）" do
        @user.last_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name furigana can't be blank"
      end

      it "ユーザー本名のフリガナは全角（カタカナ）以外だと登録できない（名字）" do
        @user.first_name_furigana = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name furigana is invalid"
      end

      it "ユーザー本名のフリガナは全角（カタカナ）以外だと登録できない（名前）" do
        @user.last_name_furigana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name furigana is invalid"
      end

      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end