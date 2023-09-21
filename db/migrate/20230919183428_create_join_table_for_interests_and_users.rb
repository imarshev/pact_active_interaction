class CreateJoinTableForUsersAndInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :interests_users, id: false do |t|
      t.bigint :user_id, null: false
      t.bigint :interest_id, null: false
    end

    add_index :interests_users, %i[user_id interest_id], unique: true
  end
end
