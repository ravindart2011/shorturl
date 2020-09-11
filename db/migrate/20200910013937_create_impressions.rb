class CreateImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :impressions do |t|
      t.references :link, foreign_key: true
      t.string :ip_address
      t.string :country

      t.timestamps
    end
  end
end
