class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index 
    instructors = Instructor.all
    render json: instructors
    end
    def show 
    instructors = Instructor.find(params[:id])
    render json: instructors, status: :ok
    end

    def create 
    instructor = Instructor.create!(instructor_params)
    render json: instructor,status: :created
    end
    
def update
instructor = Instructor.find(params[:id])
instructor.update!(instructor_params)
render json: instructor,status: :accepted
end
def destroy 
instructor = Instructor.find(params[:id])
instructor.destroy
    head :no_content 
end
    private 
    def instructor_params
        params.permit(:name)
    end

    def record_not_found 
        render json: {error: "not found" }, status: :not_found
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: 422
    end
end
