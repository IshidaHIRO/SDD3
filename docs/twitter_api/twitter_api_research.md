# Twitter APIの使い方調査

## 概要
### やりたいこと
* 公開されているツイートから特定キーワードを含むものを抽出する

## 利用方法
### 準備
* アプリケーションの登録（APIキーの取得）  
　→Twitter APIではConsumer KeyとConsumer Secretの２種類がある
* アクセストークンの取得（とりあえずプログラミングなしで設定画面から）  
　→こちらも同様に２種類
* 参考  
[Twitter APIの使い方まとめ](https://syncer.jp/twitter-api-matome)  
[Twetter Gem](https://github.com/sferik/twitter)  

### プログラム作成
* 今回はTwitter Gemを使用する
* 参考  
[RubyでTwitterのAPIを利用してツイートを取得](http://qiita.com/gash717/items/c9617556e99444ec57a0)

### 検索条件の指定
* Twitter GemのTwitter::REST::Client.searchメソッドを使用する
* 第一引数に検索キーワードを指定し、後ろに色々なオプションの指定が可能
* オプションcount：取得件数を指定
* オプションresult_type：内容指定。recentで最近の内容、popularで人気の内容。
* オプションexclude : 除外する内容。retweetsでリツイートを除外。
* since_id : 指定ID以降から検索だが、検索結果が100件以上の場合は無効
* Gemの仕様  
[Module: Twitter::REST::Search](http://www.rubydoc.info/gems/twitter/Twitter/REST/Search#search-instance_method)

* 検索キーワードはANDやORで複数指定が出来る
* その他、ポジティブやネガティブのTweetを対象にする、のようなことも
* APIのsearchの仕様  
[GET search/tweets - ツイートを検索する](https://syncer.jp/twitter-api-matome/get/search/tweets)

