# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[destroy]

  def new
    @employee = Employee.new
    @company = Company.find(params[:company_id])
    @company_offices = Office.where(company_id: @company).map do |office|
      [office.building.name, office.building.id]
    end

    if @company_offices.empty?
      redirect_to company_path(@company), notice: 'You need an office before you can hire employees'
    end
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to company_path(@employee.company), notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to company_path(@employee.company), notice: 'Employee was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :title, :office_id)
  end
end
