# require 'rails_helper'

# RSpec.describe Task, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"


# # ここから書き始め。

# # require 'rails_helper'
# describe 'タスクモデル機能', type: :model do
#   describe 'バリデーションのテスト' do
#     context 'タスクのタイトルが空の場合' do
#       it 'バリデーションにひっかる' do
#         task = Task.new(title: '', content: '失敗テスト')
#         expect(task).not_to be_valid
#       end
#     end

#       context 'タスクの詳細が空の場合' do
#       it 'バリデーションにひっかかる' do
#         # ここに内容を記載する
#         task = Task.new( title: "テスト",content: "")
#         expect(task).not_to be_valid
#       end
#     end
#     # context 'タスクのタイトルと詳細に内容が記載されている場合' do
#     #   it 'バリデーションが通る' do
#     #     ここに内容を記載する。
#     #     task = Task.new(
#     #       content: nil,
#     #       content: "testman",
#     #     )
#     #     expect(task.errors[:title]).to include("can't be blank")
#     #     end
#     #   end
#     end 
#   end
# end


require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do

  it 'titleが空ならバリデーションが通らない' do
    task = FactoryBot.build(:task, title: '')
    expect(task).not_to be_valid
  end

  it 'contentが空ならバリデーションが通らない' do
    task = FactoryBot.build(:task, content: '')
    expect(task).not_to be_valid
  end

  it 'titleとcontentに内容が記載されていればバリデーションが通る' do
    task = FactoryBot.build(:task, title: '成功テスト', content: '成功テスト')
    expect(task).to be_valid
  end
end
