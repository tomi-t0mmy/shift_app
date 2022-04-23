Hanami::Model.migration do
  change do
    create_table :shifts do
      primary_key :id
      foreign_key :user_id, :users, on_delete: :cascade, null: false

      column :year, Integer, null: false
      column :month, Integer, null: false
      column :day, Integer, null: false
      column :lunch_start, Integer
      column :lunch_finish, Integer
      column :dinner_start, Integer
      column :dinner_finish, Integer
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
