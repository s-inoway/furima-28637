require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー情報' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "ニックネームが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "メールアドレスが一意性であること" do
      @user.save
      other_user = FactoryBot.build(:user)
      other_user.email = @user.email
      other_user.valid?
      expect(other_user.errors.full_messages).to include "Email has already been taken"
    end
    
    it "メールアドレスは@を含む必要があること" do
      @user.email = "mailaddressgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "パスワードは6文字以上であること" do
      @user.password = "abc12"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it "パスワードは半角英数字混合であること(英字のみの確認)" do
      @user.password = "abcdefgh"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "パスワードは半角英数字混合であること(数字のみの確認)" do
      @user.password = "12345678"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = #次はここから
      @user.valid?
      expect(@user.errors.full_messages).to include #次はここから
    end

    it "新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）" do
  
    end
  end

  describe '本人情報確認' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "ニックネームが必須であること" do

    end
    
    it "メールアドレスが必須であること" do

    end
    
    it "メールアドレスが一意性であること" do

    end
    
    it "メールアドレスは@を含む必要があること" do

    end
    
    it "パスワードが必須であること" do

    end
    
    it "パスワードは6文字以上であること" do

    end
    
    it "パスワードは半角英数字混合であること" do

    end
    
    it "パスワードは確認用を含めて2回入力すること" do

    end
    
    it "新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）" do

    end
    
  end
end