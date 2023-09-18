class RecipesController < ApplicationController
 rescue_from ActiveRecord::RecordInvalid, with: :invalid_record_response

    def index 
        recipe = Recipe.all
        render json: recipe, status: :created
    end

    def create
        recipe = @user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

    def invalid_record_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
