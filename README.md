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
- `id`: 主キー
- `name`: ユーザーの名前
- `email`: メールアドレス（ユニーク）
- `password_digest`: パスワード（セキュアなハッシュ）
- `created_at`: レコード作成日時
- `updated_at`: レコード更新日時

### Patients（患者）
- `id`: 主キー
- `user_id`: 外部キー（Usersテーブルへの参照）
- `name`: 患者の名前
- `birthdate`: 生年月日
- `gender`: 性別
- `created_at`: レコード作成日時
- `updated_at`: レコード更新日時

### Medications（薬剤）
- `id`: 主キー
- `name`: 薬の名前
- `description`: 薬の説明
- `dosage`: 用量
- `side_effects`: 副作用
- `created_at`: レコード作成日時
- `updated_at`: レコード更新日時

### Prescriptions（処方）
- `id`: 主キー
- `patient_id`: 外部キー（Patientsテーブルへの参照）
- `medication_id`: 外部キー（Medicationsテーブルへの参照）
- `prescribed_at`: 処方日時
- `dosage`: 用量
- `frequency`: 服用頻度
- `duration`: 服用期間
- `created_at`: レコード作成日時
- `updated_at`: レコード更新日時

### Doctors（医師）
- `id`: 主キー
- `name`: 医師の名前
- `specialization`: 専門
- `contact`: 連絡先情報
- `created_at`: レコード作成日時
- `updated_at`: レコード更新日時

### Appointments（診察予約）
- `id`: 主キー
- `patient_id`: 外部キー（Patientsテーブルへの参照）
- `doctor_id`: 外部キー（Doctorsテーブルへの参照）
- `scheduled_at`: 予約日時
- `notes`: 診察メモ
- `created_at`: レコード作成日時
- `updated_at`: レコード更新日時

### RefillRequests（リフィルリクエスト）
- `id`: 主キー
- `prescription_id`: 外部キー（Prescriptionsテーブルへの参照）
- `requested_at`: リクエスト日時
- `status`: ステータス（例：Pending、Approved、Denied）
- `created_at`: レコード作成日時
- `updated_at`: レコード更新日時