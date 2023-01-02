# flutter-animation
FlutterのAnimationを理解するためのリポジトリ

# Animation
## 暗黙的アニメーション
### Hero Animation
- Hero Animationは、2つの画面間で共通の要素をアニメーションさせることができる
  - 例：画面Aにある画像をタップして画面Bに遷移したときに、画面Aの画像を画面Bにアニメーション付きで表示する
- Hero Animationを実現するためには、2つの画面間で共通のHero Widgetを配置する必要がある
- Hero Widgetは、tagというパラメータを持っており、これを使って共通のHero Widgetを識別する

