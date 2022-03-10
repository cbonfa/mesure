class CreateMesureLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :mesure_logs do |t|
      t.string :identifier
      t.float :time
      t.boolean :timeout
      t.string :error
      t.string :location
      t.text :extra_info

      t.timestamps
    end
  end
end
