class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message
    rescue_from ActiveRecord::RecordInvalid, with: :record_unprocessable_message

    def index
        campers = Camper.all
        render json: campers, status: :ok, include: []
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
