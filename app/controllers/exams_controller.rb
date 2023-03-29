class ExamsController < ApplicationController
  before_action :only_teacher
  before_action :set_course
  before_action :set_exam, only: %i[show edit update destroy]

  # GET /exams
  def index
    @exams = @course.exams
  end

  # GET /exams/1 or /exams/1.json
  def show; end

  # GET /exams/new
  def new
    @exam = @course.exams.new
  end

  # GET /exams/1/edit
  def edit; end

  # POST /exams or /exams.json
  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to course_exam_url(@course, @exam), notice: 'Exam was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1 or /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to course_exam_url(@course, @exam), notice: 'Exam was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1 or /exams/1.json
  def destroy
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to course_exam_url(@course, @exam), notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_exam
    @exam = @course.exams.find(params[:id])
  end

  def exam_params
    params.require(:exam).permit(:name, :consideration, :passed_at).merge(teacher: current_user, course: @course)
  end
end
