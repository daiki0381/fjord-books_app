# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
    assert_selector 'td', text: 'プロを目指す人のためのRuby入門'
    assert_selector 'td', text: 'Rubyの文法をサンプルコードで学び、例題でプログラミングの流れを体験できる解説書です。'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'メモ', with: 'ゼロからわかる Ruby 超入門'
    fill_in 'タイトル', with: '本書は、プログラミングが初めての方へ向けた、プログラミング言語Rubyの入門書です。'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_selector 'h1', text: '本の詳細'
    assert_selector 'p', text: 'ゼロからわかる Ruby 超入門'
    assert_selector 'p', text: '本書は、プログラミングが初めての方へ向けた、プログラミング言語Rubyの入門書です。'
    click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url
    within('tbody') do
      click_on '編集', match: :first
    end

    fill_in 'メモ', with: 'Railsの教科書'
    fill_in 'タイトル', with: 'プログラミング初学者へ向けたRailsを使ったWebアプリづくりの教科書。'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_selector 'h1', text: '本の詳細'
    assert_selector 'p', text: 'Railsの教科書'
    assert_selector 'p', text: 'プログラミング初学者へ向けたRailsを使ったWebアプリづくりの教科書。'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    assert_selector 'h1', text: '本'
    assert_selector 'td', text: 'プロを目指す人のためのRuby入門'
    assert_selector 'td', text: 'Rubyの文法をサンプルコードで学び、例題でプログラミングの流れを体験できる解説書です。'
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
