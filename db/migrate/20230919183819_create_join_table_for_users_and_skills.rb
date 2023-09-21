class CreateJoinTableForUsersAndSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills_users, id: false do |t|
      t.bigint :user_id, null: false
      t.bigint :skill_id, null: false
    end

    add_index :skills_users, %i[user_id skill_id], unique: true
  end
end
