json.extract! slide, :id, :content, :created_at, :updated_at, :sort
json.url slide_url(slide, format: :json)
json.next_slide 2
json.previous_slide_id slide.previous_slide_id
json.next_slide_id slide.next_slide_id
