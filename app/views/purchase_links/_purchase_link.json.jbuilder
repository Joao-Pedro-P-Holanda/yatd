json.extract! purchase_link, :id, :complete, :url, :created_at, :updated_at
json.url purchase_link_url(purchase_link, format: :json)
