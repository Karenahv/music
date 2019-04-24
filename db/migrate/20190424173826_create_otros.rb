class CreateOtros < ActiveRecord::Migration[5.2]
  def change
    create_table :otros do |t|
      t.string :name
      t.references :artists, foreign_key: true

      t.timestamps
    end
  end
end
