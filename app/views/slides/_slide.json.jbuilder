json.extract! slide, :id, :content, :created_at, :updated_at
json.url slide_url(slide, format: :json)
json.next_slide 2
json.previous_slide 1
