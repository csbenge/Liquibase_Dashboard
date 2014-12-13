json.array!(@database_change_logs) do |database_change_log|
  json.extract! database_change_log, :id, :ID, :AUTHOR, :FILENAME, :DATEEXECUTED, :ORDEREXECUTED, :EXECTYPE, :MD5SUM, :DESCRIPTION, :COMMENTS, :TAG, :LIQUIBASE
  json.url database_change_log_url(database_change_log, format: :json)
end
