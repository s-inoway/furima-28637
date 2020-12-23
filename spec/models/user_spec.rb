require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー情報' do

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

  describe '本人情報確認' do

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