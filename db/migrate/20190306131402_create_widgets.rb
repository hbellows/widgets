class CreateWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :widgets do |t|
      t.string :name
      t.string :description
      t.string :kind
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
