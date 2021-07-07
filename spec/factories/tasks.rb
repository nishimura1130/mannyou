FactoryBot.define do
  factory :task do
    title { 'テストを書く' }
    content { 'RSpec & Capybara & FactoryBotを準備する' }
    deadline { Time.current }
    status { :finished }
    priority { :high }
  end
end
# FactoryBot.define do
#   factory :task do
#     # 下記の内容は実際に作成するカラム名に合わせて変更してください
#     title { 'test_title' }
#     content { 'test_content' }

#   end
# end 