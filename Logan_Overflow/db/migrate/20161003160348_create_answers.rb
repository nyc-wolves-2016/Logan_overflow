class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.boolean :starred, default: false
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
