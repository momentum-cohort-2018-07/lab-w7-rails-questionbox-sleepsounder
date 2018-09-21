class AddAnswerableIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :answerable_id, :integer
  end
end
