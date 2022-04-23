Hanami::Model.migration do
  change do
    create_table :submits do
      primary_key :id
      foreign_key :user_id, :user, on_delete: :cascade, null: false
      extension :pg_enum
      create_enum :submit_types, %w(first second)

      column :year, Integer, null: false
      column :month, Integer, null: false
      column :type, 'submit_types', null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
