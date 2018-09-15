class AddUsernameToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :username, :string
  end
end
