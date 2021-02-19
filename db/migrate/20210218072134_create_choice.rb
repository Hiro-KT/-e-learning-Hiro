class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :content
      t.integer :word_id
      t.boolean :is_correct

      t.timestamps
    end
  end
end
