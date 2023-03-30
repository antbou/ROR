class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show; end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit; end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    teacher_ids = params[:course][:teacher_ids]
    promotions_ids = params[:course][:promotion_ids]

    respond_to do |format|
      if @course.save
        @course.teachers << Teacher.where(id: teacher_ids.reject(&:empty?).map(&:to_i))
        @course.promotions << Promotion.where(id: promotions_ids.reject(&:empty?).map(&:to_i))
        format.html { redirect_to course_url(@course), notice: 'Course was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    teacher_ids = params[:course][:teacher_ids]
    promotion_ids = params[:course][:promotion_ids]

    respond_to do |format|
      if @course.update(course_params)
        @course.teachers = Teacher.where(id: teacher_ids.reject(&:empty?).map(&:to_i))
        @course.promotions = Promotion.where(id: promotion_ids.reject(&:empty?).map(&:to_i))

        format.html { redirect_to course_url(@course), notice: 'Course was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:title, :slug, :description, :category_id, :quarter_id)
  end
end
