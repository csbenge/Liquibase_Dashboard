class SchemasController < ApplicationController
  before_action :set_schema, only: [:show, :edit, :update, :destroy]
  before_action :set_internal_database

  def index
    @schemas = Schema.all
  end

  def show
  end

  def new
    @schema = Schema.new
  end

  def edit
  end

  def create
    @schema = Schema.new(schema_params)

    respond_to do |format|

      if set_Schema_Connection(@schema) == 0
        if ActiveRecord::Base.connection.table_exists? @schema.changelogtable
          set_internal_database
          if @schema.save
            flash[:success] = 'Schema was successfully created.'
            format.html { redirect_to @schema }
            #format.html { redirect_to @schema, notice: 'Schema was successfully created.' }
            #format.json { render :show, status: :created, location: @schema }
          else
            format.html { render :new }
            format.json { render json: @schema.errors, status: :unprocessable_entity }
          end
        else
          set_internal_database
          flash[:error] = 'Connected to Schema but does not appear to be managed by Liquibase.'
          format.html { redirect_to schemas_url }
        end
      else
        set_internal_database
        flash[:error] = 'Could not connect to Schema.'
        format.html { redirect_to schemas_url }
      end
    end
  end

  def update
    respond_to do |format|
      if @schema.update(schema_params)
        flash[:success] = 'Schema was successfully updated.'
        format.html { redirect_to @schema }
        #format.html { redirect_to @schema, notice: 'Schema was successfully updated.' }
        #format.json { render :show, status: :ok, location: @schema }
      else
        format.html { render :edit }
        format.json { render json: @schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schemas/1
  # DELETE /schemas/1.json
  def destroy
    @schema.destroy
    respond_to do |format|
      format.html { redirect_to schemas_url, notice: 'Schema was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schema
      @schema = Schema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schema_params
      params.require(:schema).permit(:name, :database_type, :username, :password, :changelogfile, :changelogtable, :host, :port, :application_id, :environment_id)
    end

    def set_internal_database
      ActiveRecord::Base.establish_connection(
        :adapter  => "sqlite3",
        :database => "db/lbview_#{Rails.env}.sqlite3"
      )
    end
end
