class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.string :slug
      t.boolean :expired, default: false
      t.datetime :expired_at

      t.timestamps
    end
  end
end
