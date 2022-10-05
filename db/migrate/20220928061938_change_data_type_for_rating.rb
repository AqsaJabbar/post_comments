class ChangeDataTypeForRating < ActiveRecord::Migration[6.0]
  def self.up
    change_table :comments do |t|
      t.change :rating, :float
    end
  end
  def self.down
    change_table :comments do |t|
      t.change :rating, :integer
    end
  end
end
