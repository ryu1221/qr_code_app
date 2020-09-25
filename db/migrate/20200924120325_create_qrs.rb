class CreateQrs < ActiveRecord::Migration[6.0]
  def change
    create_table :qrs do |t|
      t.string :url

      t.timestamps
    end
  end
end
