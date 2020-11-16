require 'rails_helper'

describe 'タスク管理', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user)
      FactoryBot.create(:task, name: "最初のタスク", user: user_a)
    end

    context "ユーザーAがログインしている時" do
      before do
        visit login_path
        find("#session-email").set("a@examle.com")
        find("#session-password").set("password")

        click_button "ログインする"
      end

      it "ユーザーAが作成したタスクが表示される" do
        expect(page).to have_content "最初のタスク"
      end
    end
  end
end