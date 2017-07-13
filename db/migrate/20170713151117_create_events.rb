class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string    :title
      t.string    :location
      t.datetime  :date
      t.integer   :creator_id
      t.timestamps
    end
  end
end
