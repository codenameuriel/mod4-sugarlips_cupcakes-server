class CreateCupcakes < ActiveRecord::Migration[6.0]
  def change
    create_table :cupcakes do |t|
      t.string :name
      t.string :flavor
      t.integer :price

      t.timestamps
    end
  end
end
