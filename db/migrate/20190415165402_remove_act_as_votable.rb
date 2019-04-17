class RemoveActAsVotable < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :cached_votes_total
    remove_column :articles, :cached_votes_score
    remove_column :articles, :cached_votes_up
    remove_column :articles, :cached_votes_down
    remove_column :articles, :cached_weighted_score
    remove_column :articles, :cached_weighted_total
    remove_column :articles, :cached_weighted_average

    drop_table :votes
  end
end











