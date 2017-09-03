class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :job, foreign_key: true
      t.string :notes

      t.timestamps
    end
  end
end
