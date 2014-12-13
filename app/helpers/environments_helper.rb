module EnvironmentsHelper

  def get_Environment_Count()
    environments = Environment.all
    count = 0
    if environments
      count = environments.count
    end
    count
  end

	def get_Environment_Name(id)
    environment = Environment.find_by_id(id)
    environment.name
  end

  def get_Environment_Schemas(id)
    schemas = Schema.find_by_environment_id(id)
    schemas
  end

end
