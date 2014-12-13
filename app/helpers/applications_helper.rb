module ApplicationsHelper
  
  def get_Application_Count()
    applications = Application.all
    count = 0
    if applications
      count = applications.count
    end
    count
  end

  def get_Application_Name(id)
    application = Application.find_by_id(id)
    application.name
  end

  def get_Application_Schemas_List(id)
    set_internal_database()
    schemaList = ""
    schemas = Schema.where("application_id >= '#{id}'")
    schemas.each do |s|
      if !schemaList.include? s.name
        schemaList << s.name + ", "
      end
    end
    if schemaList == ""
      return "No schemas defined and/or associated."
    else
      return schemaList.chop.chop
    end
  end
  
end
