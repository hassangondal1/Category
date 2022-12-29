class CreateProgramUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :program_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :program, index: true
      t.timestamps
    end
  end
end
