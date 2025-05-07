class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]

  # GET /lessons or /lessons.json
  def index
    if params[:trail_id].present?
      @trail = Trail.find_by(id: params[:trail_id])
      @lessons = @trail ? @trail.lessons : []
    else
      @lessons = Lesson.all.includes(:trail)
    end
  end

  # GET /lessons/1 or /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
    @lesson = Lesson.find(params[:id])
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append("lessons", partial: "lessons/lesson", locals: { lesson: @lesson }) }
        format.html { redirect_to trail_path(@lesson.trail), notice: "Módulo criado com sucesso." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    if @lesson.update(lesson_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @lesson.trail, notice: "Módulo atualizado com sucesso." }
      end
    else
      render turbo_stream: turbo_stream.replace("modal", partial: "lesson_modal", locals: { lesson: @lesson })
    end
  end



  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@lesson) }
      format.html { redirect_to trail_path(@lesson.trail), notice: "Módulo excluído com sucesso." }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.expect(lesson: [ :title, :content, :trail_id ])
    end
end
