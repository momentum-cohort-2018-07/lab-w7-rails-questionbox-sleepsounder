json.links do
  json.self api_v1_question_url(@question)
  json.list api_v1_questions_url
end 

json.data do
  json.id @question.id
  json.attributes do
    json.title @question.title
    json.question @question.body
  end
end

