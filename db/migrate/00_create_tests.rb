class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :foo
    end
  end
end