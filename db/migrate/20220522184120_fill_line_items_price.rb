class FillLineItemsPrice < ActiveRecord::Migration[6.0]
  def up
    line_items = LineItem.all
    line_items.each do |line_item|
      line_item.price = line_item.product.price
      line_item.save!
    end
  end

  def down
    remove_column :line_items, :price
  end
end
