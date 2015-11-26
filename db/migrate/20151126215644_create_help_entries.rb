class CreateHelpEntries < ActiveRecord::Migration
  def change
    create_table :help_entries do |t|
      t.string :description
      t.string :title

      t.timestamps null: false
    end
  end
end
