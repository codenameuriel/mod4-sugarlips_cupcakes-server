class AddImageToCupcakes < ActiveRecord::Migration[6.0]
  def change
    add_column :cupcakes, :image, :string
  end
end
