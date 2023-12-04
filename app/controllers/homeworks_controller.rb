class HomeworksController < ApplicationController
  def index
    matching_homeworks = Homework.all

    @list_of_homeworks = matching_homeworks.order({ :created_at => :desc })

    render({ :template => "homeworks/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_homeworks = Homework.where({ :id => the_id })

    @the_homework = matching_homeworks.at(0)

    render({ :template => "homeworks/show" })
  end

  def insert_page
    render({ :template => "homeworks/insert_page" })
  end

  def update_page
    the_id = params.fetch("path_id")

    matching_homeworks = Homework.where({ :id => the_id })

    @the_homework = matching_homeworks.at(0)


    render({ :template => "homeworks/update_page" })

  end

  def create
    the_homework = Homework.new
    the_homework.course_id = params.fetch("query_course_id")
    the_homework.due_date = params.fetch("query_due_date")
    the_homework.estimated_time = params.fetch("query_estimated_time")
    the_homework.file_path = params.fetch("query_file_path")
    the_homework.instruction = params.fetch("query_instruction")
    the_homework.questions = params.fetch("query_questions")
    the_homework.student_id = params.fetch("query_student_id")
    the_homework.progress = params.fetch("query_progress")

    if the_homework.valid?
      the_homework.save
      redirect_to("/homeworks", { :notice => "Homework created successfully." })
    else
      redirect_to("/homeworks", { :alert => the_homework.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_homework = Homework.where({ :id => the_id }).at(0)

    the_homework.course_id = params.fetch("query_course_id")
    the_homework.due_date = params.fetch("query_due_date")
    the_homework.estimated_time = params.fetch("query_estimated_time")
    the_homework.file_path = params.fetch("query_file_path")
    the_homework.instruction = params.fetch("query_instruction")
    the_homework.questions = params.fetch("query_questions")
    the_homework.student_id = params.fetch("query_student_id")
    the_homework.progress = params.fetch("query_progress")

    if the_homework.valid?
      the_homework.save
      redirect_to("/homeworks/#{the_homework.id}", { :notice => "Homework updated successfully."} )
    else
      redirect_to("/homeworks/#{the_homework.id}", { :alert => the_homework.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_homework = Homework.where({ :id => the_id }).at(0)

    the_homework.destroy

    redirect_to("/homeworks", { :notice => "Homework deleted successfully."} )
  end
end
