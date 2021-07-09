# require 'rails_helper'
# describe 'タスクモデル機能', type: :model do
#   describe 'バリデーションのテスト' do
#     context 'タスクのタイトルが空の場合' do
#       it 'バリデーションにひっかる' do
#         task = Task.new(title: '', content: '失敗テスト')
#         expect(task).not_to be_valid
#       end
#     end
# 　　context 'タスクの詳細が空の場合' do
#       it 'バリデーションにひっかかる' do
#         # ここに内容を記載する
#         task = Task.new(
#           first_title: nil,
#           last_title: "testman",
#           email: "testman@example.com",
#           password: "password",
#         )
#         task.valid?
#         expect(task.errors[:first_name]).to include("can't be blank") 
#       end
#     end
#     context 'タスクのタイトルと詳細に内容が記載されている場合' do
#       it 'バリデーションが通る' do
#         ここに内容を記載する。
#         task = Task.new(
#           fiist_content: nil,
#           last_content: "testman"
#           emial: "testman@example.com",
#           password: "password", 
#         )
#         task.vaild?
#         expect(task.errors[:first_name]).to include("can't be blank")
#       end
#     end
#   end 
# end


require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do

      it '作成済みのタスクが表示されること' do
        task = FactoryBot.create(:task, title: 'rspectest')
        visit tasks_path
        expect(page).to have_content 'rspectest'
      end
    end
  end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit new_task_path
        # タスク入力フォームにタスク内容が入力する
        fill_in 'Title', with: 'createtest'
        fill_in 'Content', with: 'createtest'
        fill_in 'Deadline', with: Time.current
        choose 'task_status_finished'
        sleep 0.5
        choose 'task_priority_high'
        # タスク作成ボタンをクリック
        click_on 'Create Task'
        # タスクが作成されたか検証する
        expect(page).to have_content 'タスクを作成しました'
      end
    end
  end

  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示されたページに遷移すること' do
         task = FactoryBot.create(:task, title: 'showtest')
         visit task_path(task.id)
         expect(page).to have_content 'showtest'
       end
     end
  end
end