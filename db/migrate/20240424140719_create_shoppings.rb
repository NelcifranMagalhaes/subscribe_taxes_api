class CreateShoppings < ActiveRecord::Migration[7.1]
  def change
    create_table :shoppings do |t|
      t.float :total_taxes
      t.float :total_value

      t.timestamps
    end
  end
end
