class DatabaseChangeLogsController < ApplicationController
  before_action :set_database_change_log, only: [:show]
  before_action :set_internal_database

  def index

    # Switch to database schema
    schema = Schema.find(params[:id])
    set_Schema_Connection(schema)

    @database_change_log    = NIL
    @databaseChangeLogTable = params["databaseChangeLogTable"]
    @schemaID   = params[:id]
    @schemaName = params["schemaName"]
    DatabaseChangeLog.table_name = @databaseChangeLogTable
    begin
      @database_change_log = DatabaseChangeLog.all
    rescue Exception => e
      # Do some processing and resave
      set_internal_database()
      @database_change_log = NIL
      msg = "Could not connect to database: Schema:" << schema.name << ", Host:" << schema.host << ", ChangeLogTable:" << @databaseChangeLogTable
      flash[:error] = msg
    end
    #set_internal_database
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_database_change_log
      @database_change_log = DatabaseChangeLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def database_change_log_params
      params.require(:database_change_log).permit(:ID, :AUTHOR, :FILENAME, :DATEEXECUTED, :ORDEREXECUTED, :EXECTYPE, :MD5SUM, :DESCRIPTION, :COMMENTS, :TAG, :LIQUIBASE)
    end

    def set_internal_database
      ActiveRecord::Base.establish_connection(
        :adapter  => "sqlite3",
        :database => "db/lbview_#{Rails.env}.sqlite3"
      )
    end
end
