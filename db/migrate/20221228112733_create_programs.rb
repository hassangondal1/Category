class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.belongs_to :user , index: true
      t.string   :title
      t.datetime :start_date
      t.datetime :end_date
      t.integer :category
      t.timestamps
    end
  end
end
