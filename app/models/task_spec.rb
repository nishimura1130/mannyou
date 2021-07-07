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
#         # ここに内容を記載する。
#       end
#     end
#   end
lass Task < ApplicationRecord
  enum status: {not_started_yet: 0, get_started: 1, finished: 2}
  enum priority: {low: 0, medium: 1, high: 2}
end
