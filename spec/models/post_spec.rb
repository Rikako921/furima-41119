require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    context '投稿が保存できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@post).to be_valid
      end
    end

    context '投稿が保存できない場合' do
      it 'タイトルが空では保存できないこと' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end

      it '内容が空では保存できないこと' do
        @post.contents = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Contents can't be blank")
      end

      it '画像が空では保存できないこと' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end

      it 'カテゴリーが選択されていないと保存できないこと' do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Category can't be blank")
      end

      it '状態が選択されていないと保存できないこと' do
        @post.condition_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が選択されていないと保存できないこと' do
        @post.shipping_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Shipping can't be blank")
      end

      it '都道府県が選択されていないと保存できないこと' do
        @post.prefecture_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が選択されていないと保存できないこと' do
        @post.schedule_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Schedule can't be blank")
      end

      it '価格が空では保存できないこと' do
        @post.price = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300未満では保存できないこと' do
        @post.price = 299
        @post.valid?
        expect(@post.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が10000000以上では保存できないこと' do
        @post.price = 10_000_000
        @post.valid?
        expect(@post.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格が整数でないと保存できないこと' do
        @post.price = '300.5'
        @post.valid?
        expect(@post.errors.full_messages).to include("Price must be an integer")
      end

      it '価格が半角数字でないと保存できないこと' do
        @post.price = '三百'
        @post.valid?
        expect(@post.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていない場合は登録できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end

    end
  end
end
