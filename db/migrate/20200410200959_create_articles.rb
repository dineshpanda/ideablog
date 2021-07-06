class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :published
      t.date :publish_date

      t.timestamps
    end
  end
end
