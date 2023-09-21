class RemoveColumnsSkillsAndInterestsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :skills
    remove_column :users, :interests
  end
end
