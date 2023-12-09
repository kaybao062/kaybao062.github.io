class NotesController < ApplicationController
  def index
    matching_notes = Note.all

    @list_of_notes = matching_notes.order({ :created_at => :desc })

    render({ :template => "notes/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_notes = Note.where({ :id => the_id })

    @the_note = matching_notes.at(0)

    render({ :template => "notes/show" })
  end

  def insert_page
    render({ :template => "notes/insert_page" })
  end

  def update_page
    the_id = params.fetch("path_id")

    matching_notes = Note.where({ :id => the_id })

    @the_note = matching_notes.at(0)


    render({ :template => "notes/update_page" })

  end

  def create
    the_note = Note.new
    the_note.course_id = params.fetch("query_course_id")
    the_note.image = params.fetch("query_image")
    the_note.student_id = params.fetch("query_student_id")
    the_note.title = params.fetch("query_title")
    the_note.content = params.fetch("query_content")
    the_note.questions = params.fetch("query_questions")

    if the_note.valid?
      the_note.save
      redirect_to("/notes/#{the_note.id}", { :notice => "Note created successfully." })
    else
      redirect_to("/notes", { :alert => the_note.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_note = Note.where({ :id => the_id }).at(0)

    the_note.course_id = params.fetch("query_course_id")
    the_note.image = params.fetch("query_image")
    the_note.student_id = params.fetch("query_student_id")
    the_note.title = params.fetch("query_title")
    the_note.content = params.fetch("query_content")
    the_note.questions = params.fetch("query_questions")

    if the_note.valid?
      the_note.save
      redirect_to("/notes/#{the_note.id}", { :notice => "Note updated successfully."} )
    else
      redirect_to("/notes/#{the_note.id}", { :alert => the_note.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_note = Note.where({ :id => the_id }).at(0)

    the_note.destroy

    redirect_to("/notes", { :notice => "Note deleted successfully."} )
  end
end
