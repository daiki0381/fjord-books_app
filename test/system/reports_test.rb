# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report_of_alice)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    assert_selector 'td', text: '「Railsでテストを書く」'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '「フィヨルドブートキャンプへようこそ！」'
    fill_in '内容', with: '「フィヨルドブートキャンプへようこそ！」の課題に取り組んだ。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_selector 'h1', text: '日報の詳細'
    assert_selector 'p', text: '「フィヨルドブートキャンプへようこそ！」'
    assert_selector 'p', text: '「フィヨルドブートキャンプへようこそ！」の課題に取り組んだ。'
    click_on '戻る'
  end

  test 'updating a Report' do
    visit reports_url
    within('tbody') do
      click_on '編集', match: :first
    end

    fill_in 'タイトル', with: '「JavaScript入門」'
    fill_in '内容', with: '「JavaScript入門」の課題に取り組んだ。'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_selector 'h1', text: '日報の詳細'
    assert_selector 'p', text: '「JavaScript入門」'
    assert_selector 'p', text: '「JavaScript入門」の課題に取り組んだ。'
    click_on '戻る'
  end

  test 'destroying a Report' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    assert_selector 'td', text: '「Railsでテストを書く」'
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
