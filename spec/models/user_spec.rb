require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do
      it '全ての値が存在していれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@がないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordは半角英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは半角数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは全角文字を含むと登録できない' do
      @user.password = '1a５aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'パスワードとパスワード（確認）が一致していないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_name(全角)は、名字が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_name(全角)は、名前が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_name(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'firstname'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'last_name(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'lastname'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'kanalast_nameは、名字が空では登録できない' do
      @user.kanalast_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanalast name can't be blank")
    end

    it 'kanafirst_nameは、名前が空では登録できない' do
      @user.kanafirst_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanafirst name can't be blank")
    end

    it 'kanafirst_nameは、全角（カタカナ）での入力が必須であること' do
      @user.kanafirst_name = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanafirst name is invalid")
    end
    it 'kanalast_nameは、全角（カタカナ）での入力が必須であること' do
      @user.kanalast_name = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanalast name is invalid")
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    end
  end
end
