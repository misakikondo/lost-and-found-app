require 'rails_helper'

RSpec.describe "落とし物投稿機能", type: :system do
  before do
    @item = FactoryBot.build(:item)
    @items_name = Faker::Lorem.characters(number: 10)
    @persons_name = Faker::Name.name
    @memos = Faker::Lorem.question(word_count: 4)
    @places = Faker::Lorem.question(word_count: 4)
  end

  context '投稿に失敗したとき' do
    it '送る値が空の為、メッセージの送信に失敗すること' do
    # トップページに遷移する
    visit root_path
    # 新規投稿ページへのリンクがあることを確認する
    expect(page).to have_content('投稿する')
    # 投稿ページに移動する
    visit new_item_path
    # DBに保存されていないことを確認する
    expect {
      find('input[name="commit"]').click
    }.not_to change { Item.count }
     # 元のページに戻ってくることを確認する
     expect(current_path).to eq items_path(@item)
    end
  end

  context '投稿に成功した時' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
    # トップページに遷移する
    visit root_path
    # 新規投稿ページへのリンクがあることを確認する
    expect(page).to have_content('投稿する')
    # 投稿ページに移動する
    visit new_item_path
    # 値をテキストフォームに入力する
    fill_in 'item_items_name', with: @items_name
    fill_in 'item_persons_name', with: @persons_name
    fill_in 'item_memos',with: @memos
    fill_in 'item_places', with: @places
    select('2020', from: 'item[found_date(1i)]')
    select('October', from: 'item[found_date(2i)]')
    select('10', from: 'item[found_date(3i)]')
    select('10', from: 'item[found_date(4i)]')
    select('10', from: 'item[found_date(5i)]')

    # 添付する画像を定義する
    image_path = Rails.root.join('public/images/test_image.png')

    # 画像選択フォームに画像を添付する
    attach_file('item[image]', image_path, make_visible: true)

    # 送信した値がDBに保存されていることを確認する
    expect {
        find('input[name="commit"]').click
    }.to change { Item.count }.by(1)

    # 投稿一覧画面に遷移していることを確認する
    expect(current_path).to eq root_path(@items)

    # 送信した画像がブラウザに表示されていることを確認する
    expect(page).to have_selector("img")

    # 送信した値がブラウザに表示されていることを確認する
    expect(page).to have_content(@items)

    end
  end

end
