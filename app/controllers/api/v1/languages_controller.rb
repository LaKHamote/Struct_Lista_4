class Api::V1::LanguagesController < ApplicationController
  def index
    languages = Language.all
    render json: languages, status: :ok
  end

  def create
    new_language = Language.new(language_params)
    new_language.save!
    render json: new_language, status: :created
  rescue StandardError => e
    render json: {message: e.message}, status: :unprocessable_entity
  end

  def update
    language = Language.find(params[:id])
    language.update!(language_params)
    render json: language, status: :accepted
  rescue StandardError => e
    render json: {message: e.message}, status: :unprocessable_entity
  end

  def delete
    language = Language.find(params[:id])
    language.destroy!
    render json: language, status: :accepted
  rescue StandardError => e
    render json: {message: e.message}, status: :unprocessable_entity
  end


  private

  def language_params
    params.require(:language).permit(
    :name,
    :teacher_id
    )
  end
end
