class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :title
      t.string :answer
      t.boolean :visited, default: false
      t.string :group

      t.timestamps
    end
  end
end
