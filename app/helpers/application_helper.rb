module ApplicationHelper

  include ApplicationsHelper
  include EnvironmentsHelper
  include SchemasHelper

  def set_internal_database()
    ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :database => "db/lbview_#{Rails.env}.sqlite3"
    )
  end

  def set_Schema_Connection(schema)
    begin
      ActiveRecord::Base.establish_connection(
        :adapter  => "#{schema.database_type}",
        :host     => "#{schema.host}",
        :port     => "#{schema.port}",
        :username => "#{schema.username}",
        :password => "#{schema.password}",
        :database => "#{schema.name}"
        )
      return 0
    rescue
      set_internal_database
      return 1
    end
  end

  def bootstrap_class_for flash_type
    case flash_type
      when "success"
        "alert-success" # Green
      when "error"
        "alert-danger" # Red
      when "alert"
        "alert-warning" # Yellow
      when "notice"
        "alert-info" # Blue
      else
        flash_type.to_s
    end
  end

end
