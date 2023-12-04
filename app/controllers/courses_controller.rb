class CoursesController < ApplicationController
  def index
    matching_courses = Course.all

    @list_of_courses = matching_courses.order({ :created_at => :desc })

    render({ :template => "courses/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_courses = Course.where({ :id => the_id })

    @the_course = matching_courses.at(0)

    render({ :template => "courses/show" })
  end

  def insert
    render({ :template => "courses/insert" })
  end

  def update_page
    the_id = params.fetch("path_id")

    matching_courses = Course.where({ :id => the_id })

    @the_course = matching_courses.at(0)


    render({ :template => "courses/update_page" })

  end

  def create
    the_course = Course.new
    the_course.name = params.fetch("query_name")
    the_course.link = params.fetch("query_link")
    the_course.homework_id = params.fetch("query_homework_id")
    the_course.oh_link = params.fetch("query_oh_link")
    the_course.prof_email = params.fetch("query_prof_email")
    the_course.location = params.fetch("query_location")
    the_course.time = params.fetch("query_time")
    the_course.student_id = params.fetch("query_student_id")

    if the_course.valid?
      the_course.save
      redirect_to("/courses/#{the_course.id}", { :notice => "Course created successfully." })
    else
      redirect_to("/courses", { :alert => the_course.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_course = Course.where({ :id => the_id }).at(0)

    the_course.name = params.fetch("query_name")
    the_course.link = params.fetch("query_link")
    the_course.homework_id = params.fetch("query_homework_id")
    the_course.oh_link = params.fetch("query_oh_link")
    the_course.prof_email = params.fetch("query_prof_email")
    the_course.location = params.fetch("query_location")
    the_course.time = params.fetch("query_time")
    the_course.student_id = params.fetch("query_student_id")

    if the_course.valid?
      the_course.save
      redirect_to("/courses/#{the_course.id}", { :notice => "Course updated successfully."} )
    else
      redirect_to("/courses/#{the_course.id}", { :alert => the_course.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_course = Course.where({ :id => the_id }).at(0)

    the_course.destroy

    redirect_to("/courses", { :notice => "Course deleted successfully."} )
  end
end
