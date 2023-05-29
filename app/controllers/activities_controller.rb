class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message

    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        render status: :no_content
    end
end
