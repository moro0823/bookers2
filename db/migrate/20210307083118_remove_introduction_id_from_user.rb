class RemoveIntroductionIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :introduction_id, :string
  end
end
