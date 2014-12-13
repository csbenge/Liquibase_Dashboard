module SchemasHelper

	def get_Schema_Count()
    schemas = Schema.all
    count = 0
    if schemas
      count = schemas.count
    end
    count
  end

  def get_Schema_Deployments_Count(days)
  	totalChangeSets = 0
  	schemas = Schema.all

    now  = Date.today
    date =  (now - days).strftime("%Y-%m-%d %H:%M:%S")

    schemas.each do |schema|
      set_Schema_Connection(schema)
    	DatabaseChangeLog.table_name = schema.changelogtable
    	changeSets = DatabaseChangeLog.where("DATEEXECUTED >= '#{date}'")
	    if changeSets
	      totalChangeSets = totalChangeSets + changeSets.count
	    end
	   end
     set_internal_database()
	   totalChangeSets
  end

  def get_Schema_Deployment_Latest_ChangeSet(schema)
    set_Schema_Connection(schema)
    changeSet = DatabaseChangeLog.order("ORDEREXECUTED").last
    set_internal_database()
    changeSet.ID
  end

  def get_Schema_Deployments_Since_Date(days)
    now = Date.today
    date =  (now - days).strftime("%Y-%m-%d %H:%M:%S")
  end

  def get_Schema_Deployments_ChangeSets(week)
  	@listChangeSets = Array.new
  	schemas = Schema.all
    
    dateStart = (week).week.ago
    dateEnd 	= (week+1).week.ago
    puts dateStart
    puts dateEnd
    dateStart = dateStart.strftime("%Y-%m-%d %H:%M:%S")
    dateEnd   = dateEnd.strftime("%Y-%m-%d %H:%M:%S")

    rowColor = true
    schemas.each do |schema|
      set_Schema_Connection(schema)
      rowColor ^= true

    	DatabaseChangeLog.table_name = schema.changelogtable
    	changeSets = DatabaseChangeLog.where("DATEEXECUTED <= '#{dateStart}' AND DATEEXECUTED >= '#{dateEnd}'")
	    changeSets.each do |changeSet|
	      @listChangeSets.push schema.id
        @listChangeSets.push schema.name
        @listChangeSets.push schema.environment_id
        @listChangeSets.push schema.changelogtable
	      @listChangeSets.push changeSet.ID
	      @listChangeSets.push changeSet.DATEEXECUTED
	      @listChangeSets.push changeSet.DESCRIPTION
        @listChangeSets.push changeSet.COMMENTS
        @listChangeSets.push rowColor
	    end
	   end
     set_internal_database()
	   @listChangeSets
  end

  def get_Schema_Deployment_Latest_ExecDate(schema)
    set_Schema_Connection(schema)
    changeSet = DatabaseChangeLog.order("ORDEREXECUTED").last
    set_internal_database()
    changeSet.DATEEXECUTED
  end

  def get_Schema_Deployments_Status(schema)
    count = get_Schema_Deployments_Pending(schema).count
    if count > 0
      return "<span class='label label-warning'>Partially Deployed[#{count}]</span>"
    else
      return "<span class='label label-success'>Fully Deployed</span>"
    end
  end

  def get_Schema_Deployments_Pending(schemaID)
    set_internal_database
    schema = Schema.find(schemaID)
    changelog = XmlSimple.xml_in(schema.changelogfile)

    # Get ChangeSet id's
    change_sets = Array.new
    changelog['changeSet'].each do |item|
     item.sort.each do |k, v|
        if ["id"].include? k
           change_sets.push(v) if k=="id"
        end
      end
    end

    # Get the databasechangelog
    if set_Schema_Connection(schema) == 0
      database_change_log = DatabaseChangeLog.all

      # See if id's are in databasechangelog
      @undeployed_change_sets = Array.new
      if database_change_log.count != NIL
        change_sets.each do |cl_id|
          found = false
          database_change_log.each do |dbcl|
            if cl_id == dbcl.id
              found = true
            end
          end
          if !found
            @undeployed_change_sets.push(cl_id)
          end
        end
      end
    end

    set_internal_database()
    @undeployed_change_sets
  end

  def get_All_Schema_Deployments_Pending()
    schemas = Schema.all
    @all_undeployed_change_sets = Array.new
    schemas.each do |schema|
      get_Schema_Deployments_Pending(schema.id)
      if @undeployed_change_sets.count > 0
        @all_undeployed_change_sets.push schema.name
        @all_undeployed_change_sets.push @undeployed_change_sets
      end
    end
    @all_undeployed_change_sets
  end

end
