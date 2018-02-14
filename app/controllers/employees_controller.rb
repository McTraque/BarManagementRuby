class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :enable, :disable]

  # GET /employees
  # GET /employees.json
  def index
    @employees = User.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = User.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = User.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_path, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_path, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'El empleado ha sido eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  def disable
    @employee.disabled!
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'El empleado ha sido desactivado con éxito.' }
      format.json { head :no_content }
    end
  end

  def enable
    @employee.enable!
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'El empleado ha sido activado.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:user).permit(:first_name, :last_name, :address, :status, :phone_number,
        :id_card, :email, :password, :role)
    end
end
