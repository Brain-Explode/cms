class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
			t.references :task, index: true
      t.timestamps
    end
  end
end
