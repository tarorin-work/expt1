class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :image_id
      t.text :name
      t.text :introduction
      t.text :user_page

      t.timestamps
    end
  end
end
