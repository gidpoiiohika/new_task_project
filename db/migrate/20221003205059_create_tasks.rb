class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title,            null: false, default: ""
      t.string :description,      null: false, default: ""
      t.belongs_to :user,         null: false, foreign_key: true, index: true
      t.belongs_to :list,         null: false, foreign_key: true, index: true
      t.boolean :soft_deleted,    default: false
      t.integer :priority,        null: false, index: true

      t.timestamps
    end
  end
end
