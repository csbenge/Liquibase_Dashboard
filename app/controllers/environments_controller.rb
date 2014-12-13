class EnvironmentsController < ApplicationController
  before_action :set_environment, only: [:show, :edit, :update, :destroy]
  before_action :set_internal_database

  def index
    @environments = Environment.all
  end

  def show
  end

  def new
    @environment = Environment.new
  end

  def edit
  end

  def create
    @environment = Environment.new(environment_params)
    application = Application.find_by_id(@environment.application_id)
    @environment.name << "-" << application.name

    respond_to do |format|
      if @environment.save
        flash[:success] = 'Environment was successfully created.'
        format.html { redirect_to environments_path }
        #format.html { redirect_to @environment, notice: 'Environment was successfully created.' }
        #format.json { render :show, status: :created, location: @environment }
      else
        format.html { render :new }
        format.json { render json: @environment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @environment.update(environment_params)
        format.html { redirect_to @environment, notice: 'Environment was successfully updated.' }
        format.json { render :show, status: :ok, location: @environment }
      else
        format.html { render :edit }
        format.json { render json: @environment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @environment.destroy
    respond_to do |format|
      format.html { redirect_to environments_url, notice: 'Environment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_environment
      @environment = Environment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def environment_params
      params.require(:environment).permit(:name, :description, :application_id)
    end

    def set_internal_database
      ActiveRecord::Base.establish_connection(
        :adapter  => "sqlite3",
        :database => "db/lbview_#{Rails.env}.sqlite3"
      )
    end
end
