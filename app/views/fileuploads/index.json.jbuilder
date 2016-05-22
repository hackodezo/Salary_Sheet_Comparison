json.array!(@fileuploads) do |fileupload|
  json.extract! fileupload, :id, :project_name, :file_name, :start, :end, :unique, :last_row
  json.url fileupload_url(fileupload, format: :json)
end
