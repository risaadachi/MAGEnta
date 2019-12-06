# README

# Name
　MAGEnta
  Fashion enriches the heart

# Features
  私自身おしゃれをすることが好きで、日頃から10代20代向けのファッションの投稿ができる某サイトを使っています。しかし使っている中で以下の不満がありました。

   ①流行のコーディネート投稿ユーザがサイトのスポンサーで埋められてしまう
   ②目新しいコーディネートが見つけ辛い（探し方がわからない）

  日頃感じていた課題に対し、どうすればより使いやすくなるか自分で解決したいと考えたのが作成のきっかけです。
 
# MAGEnta
　ユーザと管理者に分かれています。
　ユーザはコーディネートの投稿、閲覧、検索、コメントなどができ、管理者はユーザとコーディネートの管理ができます。

  <重視している点>
    ・見ていて楽しくなるようなデザイン
    ・ファッションに興味のある人が参考にしやすい機能
    ・使用するGemなど、最低限理解して使用すること

  <使用したGemなど>
    ・mini_magick
    ・devise
    ・ransack
    ・kaminari
    ・impressionist　　　　PageViewsの計測と表示
    ・image_processing　   Activestorageのvariant（失敗）
    ・Active Storage　　     画像の投稿、複数も可能
    ・bxSlider　　　　　　 投稿画像のスライドショー
    タグ機能はGemを使わず実装。（TOXI法）
    使うとしたらacts-as-taggable-on

# Dependency
　ruby '2.5.5'
　rails '~> 5.2.3'

# Authors
　足立　理紗
