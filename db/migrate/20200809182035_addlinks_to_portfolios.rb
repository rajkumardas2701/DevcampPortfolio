class AddlinksToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :github_link, :text
    add_column :portfolios, :demo_link, :text
  end
end
