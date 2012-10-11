class CreateTableProviders < ActiveRecord::Migration
  def up
    create_table :providers do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
  end

  def down
  end
end
