class AddTagLineToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :tagline, :text
  end
end
