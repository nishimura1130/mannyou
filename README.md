# タスク管理アプリ
## テーブルスキーマ

br
br
### Taskテーブル
| カラム名 | データ型 |
----|---- 
| title | string |
| content | text |


# herokuへのデプロイ準備

1. herokuにログインする
    heroku login
1. コミットする
    git add -A
    git commmit -m "init"
3. herokuにアプリケーションを作成
heroku create
4. herokuにデプロイする
git push heroku master



