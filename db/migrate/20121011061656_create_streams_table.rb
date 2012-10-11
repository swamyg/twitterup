class CreateStreamsTable < ActiveRecord::Migration
  def up
    create_table :streams do |t|
      t.integer :provider_id
      t.datetime :broadcast_time
      t.string :content
      t.timestamps
    end
  end

  def down
    remove_table :streams
  end
end
