class AddColumnsToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :text, :text
    add_column :posts, :commentsCounter, :integer
    add_column :posts, :likesCounter, :integer
  end
end
