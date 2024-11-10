class CreateAnalytics < ActiveRecord::Migration[7.2]
  def change
    create_table :analytics do |t|
      t.json :analytics_data

      t.timestamps
    end
  end
end
