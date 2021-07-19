# require 'rails_helper'
# RSpec.describe 'タスク管理機能', type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#     @admin_user = FactoryBot.create(:admin_user)
#     @task1 = FactoryBot.create(:task, title: 'task1', user: @admin_user)
#     @task2 = FactoryBot.create(:second_task, title: 'task2', user: @admin_user)
#     visit new_session_path
#     fill_in 'Email',with: 'admin@admin.com'
#     fill_in 'Password',with: '00000000'
#     click_button 'ログイン'
#   end

#   describe '検索機能'do
#     context 'タイトルをあいまい検索した場合'do
#       it '入力値を含むタスクが表示される'do
#       visit tasks_path
#       fill_in 'タイトル検索',with: 'task1'
#       click_button 'Search'
#       sleep 0.5
#       expect(page).to have_content 'task1'
#       # expect( Task.count ).to eq 2
#     end
#   end
# context 'ステータスを検索した場合'do
# it '選択したステータスを含むタスクが表示される'do
# visit tasks_path
# select '未着手',from: 'ステータス検索'
# click_button 'Search'
# expect(page).to have_content '未着手'
# end
# end
# context 'タイトルをあいまい検索し,かつステータスを検索した場合'do
# it '入力値を含むタスクが表示され、かつ選択したステータスを含むタスクが表示される'do
# visit tasks_path
# fill_in 'タイトル検索',with: 'task1'
# select '未着手',from: 'ステータス検索'
# click_button 'Search'
# expect(page).to have_content 'task1'
# expect(page).to have_content '未着手'
# end
# end
# end
# describe '新規作成機能' do
#   context 'タスクを新規作成した場合' do
#     it '作成したタスクが表示される' do
#       visit new_task_path

#       fill_in 'Title',with: 'task1'
#       select '未着手',from: 'ステータス'
#       select '低',from: '優先順位'
#       click_button 'Create Task'
#       expect(page).to have_content 'task1'
#       expect(page).to have_content '2020'
#       expect(page).to have_content '11'
#       expect(page).to have_content '12'
#       expect(page).to have_content '未着手'
#       expect(page).to have_content '低'
#       # expect(page).to have_content 'task_failure'
#     end
#   end
#   context 'タスクが作成日時の降順に並んでいる場合' do
#     it '新しいタスクが一番上に表示される' do
#       # ここに実装する
#       visit tasks_path

#       task_list = all('tbody tr')
#       expect(task_list[0]).to have_content 'task2'
#       expect(task_list[1]).to have_content 'task1'
#     end
#   end
# end
# describe '一覧表示機能' do
#   context '一覧画面に遷移した場合' do
#     it '作成済みのタスク一覧が表示される' do
#       # task = FactoryBot.create(:task, title: 'task')

#       visit tasks_path

#       expect(page).to have_content 'task1'
#     end
#   end
#   context 'タスク終了期限でソートした場合' do
#     it '終了期限降順で表示される' do
#       # ここに実装する
#       visit tasks_path

#       click_on '終了期限でソートする'
#       sleep 0.5
#       task_list = all('tbody tr')
#       expect(task_list[0]).to have_content '2020-12-22'
#       expect(task_list[1]).to have_content '2020-11-12'
#     end
#   end
#   context '優先順位が高い順でソートした場合' do
#     it '優先順位降順で表示される' do
#       # ここに実装する
#       visit tasks_path

#       click_on '優先順位が高い順にソートする'
#       sleep 0.5
#       task_list = all('tbody tr')
#       expect(task_list[0]).to have_content '高'
#       expect(task_list[1]).to have_content '低'
#     end
#   end
# end
# describe '詳細表示機能' do
#   context '任意のタスク詳細画面に遷移した場合' do
#     it '該当タスクの内容が表示される' do
#       # @task = FactoryBot.create(:task, title: 'task')

#       visit task_path(@task1)

#       expect(page).to have_content 'task1'
#     end
#   end
# end
# end

require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    @label = FactoryBot.create(:label)
    @label2 = FactoryBot.create(:label2)
    @label3 = FactoryBot.create(:label3)
    @user = FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:admin_user)
    @task1 = FactoryBot.create(:task, title: 'task1', user: @admin_user)
    @task2 = FactoryBot.create(:second_task, title: 'task2', user: @admin_user)
    @labelling = FactoryBot.create(:labelling, task: @task1, label: @label)
    visit new_session_path
    fill_in 'Email',with: 'admin@admin.com'
    fill_in 'Password',with: '00000000'
    click_button 'ログイン'
  end

  describe '検索機能'do
    context 'タイトルをあいまい検索した場合'do
      it '入力値を含むタスクが表示される'do
        visit tasks_path
        fill_in 'タイトル検索',with: 'task1'
        click_button 'Search'
        sleep 0.5
        expect(page).to have_content 'task1'
  # expect( Task.count ).to eq 2
      end
    end
    context 'ステータスを検索した場合'do
      it '選択したステータスを含むタスクが表示される'do
        visit tasks_path
        select '未着手',from: 'ステータス検索'
        click_button 'Search'
        expect(page).to have_content '未着手'
      end
    end
    context 'ラベルを検索した場合'do
      it '選択したラベルを含むタスクが表示される'do
        visit tasks_path
        select '新規',from: 'label_id'
        click_button 'Search'
        expect(page).to have_content 'task1'
      end
    end
    context 'タイトルをあいまい検索し,かつステータスを検索した場合'do
      it '入力値を含むタスクが表示され、かつ選択したステータスを含むタスクが表示される'do
        visit tasks_path
        fill_in 'タイトル検索',with: 'task1'
        select '未着手',from: 'ステータス検索'
        click_button 'Search'
        expect(page).to have_content 'task1'
        expect(page).to have_content '未着手'
      end
    end
    context 'タイトルをあいまい検索し,かつラベルを検索した場合'do
      it '入力値を含むタスクが表示され、かつ選択したラベルを含むタスクが表示される'do
        visit tasks_path
        fill_in 'タイトル検索',with: 'task1'
        select '新規',from: 'label_id'
        click_button 'Search'
        expect(page).to have_content 'task1'
        expect(page).to have_content '新規'
      end
    end
    context 'ステータスを検索し,かつラベルを検索した場合'do
      it '入力値を含むタスクが表示され、かつ選択したステータスとラベルを含むタスクが表示される'do
        visit tasks_path
        fill_in 'タイトル検索',with: 'task1'
        select '未着手',from: 'ステータス検索'
        select '新規',from: 'label_id'
        click_button 'Search'
        expect(page).to have_content 'task1'
        expect(page).to have_content '未着手'
        expect(page).to have_content '新規'
      end
    end
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path

        fill_in 'Title',with: 'task1'
        select '未着手',from: 'ステータス'
        select '低',from: '優先順位'
        check '新規'
        # click_button 'Create Task'
        click_button 'Create Task'
        expect(page).to have_content 'task1'
        expect(page).to have_content '2020'
        expect(page).to have_content '11'
        expect(page).to have_content '12'
        expect(page).to have_content '未着手'
        expect(page).to have_content '低'
        expect(page).to have_content '新規'
      # expect(page).to have_content 'task_failure'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
      # ここに実装する
        visit tasks_path

        task_list = all('tbody tr')
        expect(task_list[0]).to have_content 'task2'
        expect(task_list[1]).to have_content 'task1'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
      # task = FactoryBot.create(:task, title: 'task')

        visit tasks_path

        expect(page).to have_content 'task1'
      end
    end
    context 'タスク終了期限でソートした場合' do
      it '終了期限降順で表示される' do
      # ここに実装する
        visit tasks_path

        click_on '終了期限でソートする'
        sleep 0.5
        task_list = all('tbody tr')
        expect(task_list[0]).to have_content '2020-12-22'
        expect(task_list[1]).to have_content '2020-11-12'
      end
    end
    context '優先順位が高い順でソートした場合' do
      it '優先順位降順で表示される' do
      # ここに実装する
        visit tasks_path

        click_on '優先順位が高い順にソートする'
        sleep 0.5
        task_list = all('tbody tr')
        expect(task_list[0]).to have_content '高'
        expect(task_list[1]).to have_content '低'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
      # @task = FactoryBot.create(:task, title: 'task')

        visit task_path(@task1)

        expect(page).to have_content 'task1'
      end
    end
  end
end