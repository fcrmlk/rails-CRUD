class CreateBooks < ActiveRecord::Migration[5.2]
	def change
		create_table :books do |t|
			t.integer :author_id
			t.string :name
			t.string :price
			t.string :description
			t.timestamps
		end
	end
end
