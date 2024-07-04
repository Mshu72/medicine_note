# お薬手帳アプリ

お薬手帳アプリは、ユーザーが薬の情報を管理し、処方情報や診察予約を追跡できるようにするためのアプリケーションです。
このREADMEでは、アプリのセットアップ方法と使用方法について説明します。

## 機能

- ユーザー登録とログイン
- 複数の患者の管理
- 薬剤情報の管理
- 処方情報の管理
- 医師情報の管理
- 診察予約の管理
- リフィルリクエストの管理

## データベース構造

### Users（ユーザー）

| colum              | Type     | Option      |
| ------             | -------- | ----------- | 
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| nickname           | string   | null: false |

has_many patients


### Patients（患者）

| colum            | Type       | Option      |
| ------           | --------   | ----------- | 
| patient_name     | string     | null: false |
| user             | references | null: false |
| birthday         | date       | null: false |

belongs_to user
has_many medications 
has_many prescriptions

### Medications（薬剤）

| colum            | Type       | Option      |
| ------           | --------   | ----------- | 
| medication_name  | string     | null: false |
| description      | text       | null: false |  
| dosage           | string     | null: false |
| side_effect      | text       | null: false |


### Prescriptions（処方）

| colum          | Type       | Option      |
| ------         | --------   | ----------- | 
| patient_id     | references | null: false |
| medication_id  | references | null: false |
| prescribed_at  | date       |
| dosage         | integer    |
| frequency      | integer    |
| duration       | integer    |


### Doctors（医師）

| colum          | Type       | Option      |
| ------         | --------   | ----------- | 
| doctor_name    | strings    | null: false |
| specialization | integer    | null: false |   
| clinic_name    | strings    | null: false |
| phone_number   | string     | null: false |

### Appointments（診察予約）

| colum          | Type       | Option      |
| ------         | --------   | ----------- | 
| patient_id     | references | null: false |
| doctor_id      | references | null: false |
| scheduled_at   | date       | null: false |
| notes          | text       |

### RefillRequests（リフィルリクエスト）
- `id`: 主キー
- `prescription_id`: 外部キー（Prescriptionsテーブルへの参照）
- `requested_at`: リクエスト日時
- `status`: ステータス（例：Pending、Approved、Denied）
- `created_at`: レコード作成日時
- `updated_at`: レコード更新日時