json.extract! quiz_question, :id, :content, :correct_anwer, :created_at, :updated_at
json.url quiz_question_url(quiz_question, format: :json)
