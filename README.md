# アーキテクチャ図

![Alt text for the image](serviceimage.drawio.png)

このプロジェクトでは Nginx と NextJS と NestJS を使用しています。NextJS の静的コンテンツを Nginx のルートパスから取得することでリクエストが NextJS のサーバーに行かずに済みます。API リクエストを送る場合は Nginx が NextJS にプロキシーパスして、NextJS が NestJS にリクエストを送りプロキシーとして機能します。
