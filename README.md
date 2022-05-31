# アプリケーション名
Choose

# アプリケーション概要
夕飯を決めるのが大変な人が、条件を絞って、あらかじめ登録した作れる料理の中からランダムで一つ選んでくれるオリジナルアプリ。

# URL
https://choose-20973.herokuapp.com/

# テスト用アカウント
- Basic認証パスワード：choose
- Basic認証ID：20973
- メールアドレス：test@test
- パスワード：123qwe

# 利用方法
## 料理登録
1. 上記の情報を使い、ログインする
2. トップページの『新しい料理を追加する』を押す
3. 最低でも料理名を入力し、送信ボタンを押す

## 料理ランダム選択
1. ヘッダー右の『お料理を決める』を押す
2. 絞り込みたいカテゴリーを選ぶ
3. 『Choose!』ボタンを押すと結果が表示され、『これに決めた！』を押すとその料理の詳細ページに移る

# アプリケーションを作成した背景
毎日料理を作る必要のある人で、何にするかを決めることが苦手な場合やどうしても思いつかないことがある。そうすると買い物にも行けず、ストレスになってしまう。そのような課題を解決するために、このアプリを作ろうと思いました。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1-G7UtILwlrXgBiyZS_Mt3We9F87fOs-ZLfnmx0VssR0/edit#gid=982722306)

# 実装した主要な機能についての画像やGIFおよびその説明
## 料理登録機能
正しく情報を入力した後、『入力OK!』ボタンを押すと登録され、詳細ページに遷移する
[![Image from Gyazo](https://i.gyazo.com/8a8791dbdfa8b74c085ea21a631d2425.gif)](https://gyazo.com/8a8791dbdfa8b74c085ea21a631d2425)

## 料理ランダム選択機能
絞り込みたいカテゴリーを選択し、『Choose!』ボタンを押すと結果が表示され、『これに決めた！』を押すことで詳細ページに遷移する
[![Image from Gyazo](https://i.gyazo.com/8599844d4cfa033c944d9d30f5e05997.gif)](https://gyazo.com/8599844d4cfa033c944d9d30f5e05997)

## レシピ追加機能
正しく情報を入力し、『入力OK!』ボタンを押すとレシピが登録され、詳細ページに表示される
[![Image from Gyazo](https://i.gyazo.com/4143e94a900acfabcd1aa60bcd2981e1.gif)](https://gyazo.com/4143e94a900acfabcd1aa60bcd2981e1)

# 実装予定の機能
- SNSアカウントを使ったログイン・連携機能
- いつ・何を作ったか記録できるカレンダー機能

# データベース設計
## ER図
[![Image from Gyazo](https://i.gyazo.com/a4f036a57436d51640c464a39d834724.png)](https://gyazo.com/a4f036a57436d51640c464a39d834724)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/2578a876572e2e390c15ca7def45cab5.png)](https://gyazo.com/2578a876572e2e390c15ca7def45cab5)

# 開発環境
Ruby/Ruby on Rails/MySQL/Github/Heroku/Visual Studio Code/JavaScript/HTML/CSS

# 工夫したポイント
- このアプリケーションを作る前に、プロトタイプを作りました。<br>
  理由は、カリキュラムとは別で、自分で要件定義から設計することが初めてで、いきなり本番だと後で変更が効かないミスや設計段階での不備が出ると考えたためです。<br>
  実際、プロトタイプと本番では設計から大きく変更がありました。また、設計周りの理解にも繋がりました。<br>
  [ChooseのプロトタイプのGitHubページ](https://github.com/malvart/proto-choose)
- 一つ実装を終える度に自分で実際に触ってみて、ユーザー視点で改良点や追加すべき機能を探しました。
