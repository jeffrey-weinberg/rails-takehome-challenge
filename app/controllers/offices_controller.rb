# frozen_string_literal: true

class OfficesController < ApplicationController
  before_action :set_office, only: %i[show edit update destroy]

  def index
    @offices = Office.all
  end

  def show; end

  def new
    @office = Office.new
    @office.company = Company.find(params[:company])
    @office.building = Building.find(params[:building_id])
    @office.floor = params[:floor]
  end

  def create
    @office = Office.new(office_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to company_path(@office.company), notice: 'Office was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_office
    @office = Office.find(params[:id])
  end

  def office_params
    params.require(:office).permit(:building_id, :company_id, :floor)
  end
end
