class StudentsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index 
        students = Student.all 
        render json: students
    end

    def show 
        student = Student.find(params[:id])
        render json: student, status: :ok
    end

    def create 
        instructor = Instructor.find(params[:instructor_id])
        student = instructor.students.create!(student_params)
        render json: student, status: :created
    end
    def update 
        student = Student.find(params[:id])
        student.update(student_params)
        render json: student, status: :accepted
    end
 
    def destroy 
        student = Student.find(params[:id])
        student.destroy
        head :no_content 
    end

    private 

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

    def record_not_found 
        render json: {error: "not found" }, status: :not_found
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: 422
    end

end