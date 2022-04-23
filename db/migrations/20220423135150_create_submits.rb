Hanami::Model.migration do
  change do
    create_table :submits do
      primary_key :id
      foreign_key :user_id, :users, on_delete: :cascade, null: false

      column :year, Integer, null: false
      column :month, Integer, null: false
      column :period, :boolean, null: false, default: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
