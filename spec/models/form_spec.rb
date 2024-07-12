require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    @form = FactoryBot.build(:form, user_id: user.id, post_id: post.id)
    end

  describe '配送先情報の保存' do
    context '配送先情報が保存できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@form).to be_valid
      end
      it '建物名が空でも保存できること' do
        @form.building = ''
        expect(@form).to be_valid
      end
    end

    context '配送先情報が保存できない場合' do
      it '郵便番号が空では保存できないこと' do
        @form.postal_code = ''
        expect(@form).to_not be_valid
        expect(@form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が「3桁-4桁」の半角文字列でなければ保存できないこと' do
        @form.postal_code = '1234567'
        expect(@form).to_not be_valid
        expect(@form.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が1では保存できないこと' do
        @form.prefecture_id = 1
        expect(@form).to_not be_valid
        expect(@form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では保存できないこと' do
        @form.city = ''
        expect(@form).to_not be_valid
        expect(@form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できないこと' do
        @form.street = ''
        expect(@form).to_not be_valid
        expect(@form.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空では保存できないこと' do
        @form.tell_number = ''
        expect(@form).to_not be_valid
        expect(@form.errors.full_messages).to include("Tell number can't be blank")
      end
      it '電話番号が10桁未満では保存できないこと' do
        @form.tell_number = '090123456'
        expect(@form).to_not be_valid
        expect(@form.errors.full_messages).to include("Tell number is invalid")
      end
      it '電話番号が12桁以上では保存できないこと' do
        @form.tell_number = '090123456789'
        expect(@form).to_not be_valid
        expect(@form.errors.full_messages).to include("Tell number is invalid")
      end
      it '電話番号にハイフンが含まれていると保存できないこと' do
        @form.tell_number = '090-1234-5678'
        expect(@form).to_not be_valid
        expect(@form.errors.full_messages).to include("Tell number is invalid")
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @form.user_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it 'post_idが紐づいていなければ購入できないこと' do
        @form.post_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Post can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end