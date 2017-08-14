class Api::AssignmentsController < ApplicationController
	def index
		assignments = Assignment.all
		render json: assignments, status: 200
	end
	
	def create
		assignment = Assignment.new(assignment_params)
		if assignment.save
			render json: assignment, status: 201
		else
			render json: assignment.errors, status: :unprocessable_entity 
		end
	end

	private
	def assignment_params
		params.require(:assignment).permit(:timeslot_id, :boat_id)
	end
end
