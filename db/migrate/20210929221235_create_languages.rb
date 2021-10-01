class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :name
      t.references :teacher, null: true , foreign_key: true

      t.timestamps
    end
  end
end
