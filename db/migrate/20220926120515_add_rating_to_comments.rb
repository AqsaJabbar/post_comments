class AddRatingToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :rating, :integer, default: 0
  end
end
