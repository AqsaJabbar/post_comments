class DropRatingCachesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :rating_caches
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
