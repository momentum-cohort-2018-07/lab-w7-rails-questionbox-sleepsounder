class AddAnswerableTypeToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :answerable_type, :string
  end
end
