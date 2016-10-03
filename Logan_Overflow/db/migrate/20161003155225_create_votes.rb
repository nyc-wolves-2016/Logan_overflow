class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :status
      t.references :voteable, polymorphic: true, index: true
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
