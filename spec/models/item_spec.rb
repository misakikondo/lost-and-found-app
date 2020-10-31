require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '落とし物投稿の保存' do
    before do
      @item = FactoryBot.build(:item)
    end

    context 'レシピ投稿できる場合' do
      it '画像１枚と全てのフォームに値が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context 'レシピ投稿できない場合' do
      it 'imageがないと投稿できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'items_nameがないと投稿できないこと' do
        @item.items_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end

      it 'persons_nameがないと投稿できないこと' do
        @item.persons_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Persons name can't be blank")
      end

      it 'memosがないと投稿できないこと' do
        @item.memos = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Memos can't be blank")
      end

      it 'placesがないと投稿できないこと' do
        @item.places = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Places can't be blank")
      end

      it 'found_dateがないと投稿できないこと' do
        @item.found_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Found date can't be blank")
      end
    end
  end
end