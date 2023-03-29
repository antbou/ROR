class EvaluationsController < ApplicationController
  before_action :only_teacher
  before_action :set_exam
  before_action :set_evaluation, only: %i[show edit update destroy]

  # GET /evaluations or /evaluations.json
  def index
    @evaluations = @exam.evaluations
  end

  # GET /evaluations/1 or /evaluations/1.json
  def show; end

  # GET /evaluations/new
  def new
    @evaluation = @exam.evaluations.new
  end

  # GET /evaluations/1/edit
  def edit; end

  # POST /evaluations or /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)

    respond_to do |format|
      if @evaluation.save
        format.html do
          redirect_to exam_evaluation_path(@evaluation.exam, @evaluation),
                      notice: 'Evaluation was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1 or /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html do
          redirect_to exam_evaluation_path(@evaluation.exam, @evaluation),
                      notice: 'Evaluation was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1 or /evaluations/1.json
  def destroy
    @evaluation.destroy

    respond_to do |format|
      format.html { redirect_to exam_evaluations_path, notice: 'Evaluation was successfully destroyed.' }
    end
  end

  private

  def set_exam
    @exam = Exam.find(params[:exam_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_evaluation
    @evaluation = @exam.evaluations.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def evaluation_params
    params.require(:evaluation).permit(:grade, :student_id).merge(teacher: current_user, exam: @exam)
  end
end
