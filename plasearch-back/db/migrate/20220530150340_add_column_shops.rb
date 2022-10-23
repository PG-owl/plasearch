class AddColumnShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :lat, :decimal
    add_column :shops, :lng, :decimal
    add_column :shops, :phone_number, :string
    add_column :shops, :post_code, :string
    add_column :shops, :address, :string
    add_column :shops, :opening_hours, :string
    add_column :shops, :holiday_opening_hours, :string
    add_column :shops, :photo_reference, :string
    add_column :shops, :rating, :decimal
    add_column :shops, :site_url, :string
    add_column :shops, :place_id, :string
  end
end
