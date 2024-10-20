# 第10回課題
## 実施した内容
### これまで構築した環境をCloudformationで自動化
スタックは、以下のとおりネットワーク、セキュリティ、アプリケーションの３つに分けて作成した。<br>
1.ネットワーク<br>
  東京リージョン内にVPC、IGWを構築<br>
  ２つのAZを使用し、  それぞれのAZにパブリックサブネット、プライベートサブネット　合計４つのサブネット構築

2.セキュリティ<br>
  EC2のセキュリティグループ<br>
  RDSのセキュリティグループ<br>
  S3へのアクセスのためのIAMロール、ポリシー

3.アプリケーション
  パブリックサブネットの1つにEC2を構築<br>
  EC2から、プライベートサブネットに構築したRDSに接続<br>
  ALBを構築し、外部のインターネットからの接続をALBで受付け、EC2に接続<br>
  VPC外にS3を構築し、EC2から接続<br>
※接続の確認のため、mySQL,Nginx,CLIをUserdateでインストールも実施<br>



・[ネットワークyml](/yml10/Lecture10_network)<br>
　VPC構築/２つのAZに合計サブネットを４つ構築/IGWを構築し、パブリックサブネット２つを接続<br>
 ![VPC](images10/VPC.png)<br>

・[セキュリティyml](/yml10/Lecture10_security)<br>
　EC2のセキュリティグループ<br>
  ![EC2-security](images10/EC2-security.png)
　RDSのセキュリティグループ<br>
  ![RDS](images10/RDS-security.png)
　S3へのアクセスのためのIAMロール、ポリシー<br>
　![IAM](images10/IAMROLE.png)

・[アプリケーションyml](/yml10/Lecture10_App.yml)<br>

  パブリックサブネットの1つにEC2を構築<br>
　![EC2](images10/EC2.png)
  RDSの構築<br>
  ![RDS](images10/RDS.png)
　EC2から、プライベートサブネットに構築したRDSに接続<br>
  ![EC2toRDS](images10/EC2toRDS.png)
　ALBを構築<br>
  ![ALB](images10/ALB.png)
  外部のインターネットからの接続をALBで受付け、EC2に接続<br>
  (ターゲットグループ、ヘルスチェック）<br>
  ![ALBTaeget](images10/ALBTarget.png)
　S3構築<br>
　![S3](images10/S3.png)
　EC2からS3に接続<br>
　（S3にデータを入れ、削除できるか確認）<br>
　![EC2toS3](images10/EC2toS3.png)
　
## 第１０回の感想<br>
最初は書きなれないのでエラーが多かったがだんだん慣れてくると便利でおもしろかった。<br>
Userdataも入れてみたかったので、接続確認用にmysqlなどをインストールしてみた。<br>
あっという間に同じ環境を再現できるのはクラウドならではだと思うし、すごく便利だと感じた。<br>
インターネットを見ると、リソースごとに分けてスタックを書いている例が<br>
多いように思ったが、セキュリティ関係は分散するより１枚にまとまっている<br>
ほうが漏れがなく安全に管理がしやすいのではないかと感じたため、リソースごとではなく<br>
ネットワーク、セキュリティ、アプリに分けて作成した。
