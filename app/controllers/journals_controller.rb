class JournalsController < ApplicationController
  def index
    matching_journals = Journal.all

    @list_of_journals = matching_journals.order({ :created_at => :desc })

    render({ :template => "journals/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_journals = Journal.where({ :id => the_id })

    @the_journal = matching_journals.at(0)

    render({ :template => "journals/show" })
  end

  def insert_page
    render({ :template => "journals/insert_page" })

  end

  def update_page
    the_id = params.fetch("path_id")

    matching_journals = Journal.where({ :id => the_id })

    @the_journal = matching_journals.at(0)


    render({ :template => "journals/update_page" })

  end

  def create
    the_journal = Journal.new
    the_journal.content = params.fetch("query_content")
    the_journal.title = params.fetch("query_title")
    the_journal.mood = params.fetch("query_mood")
    the_journal.weather = params.fetch("query_weather")
    the_journal.date = params.fetch("query_date")
    the_journal.author_id = params.fetch("query_author_id")
    the_journal.image = params.fetch("query_image")

    if the_journal.valid?
      the_journal.save
      redirect_to("/journals/#{the_journal.id}", { :notice => "Journal created successfully." })
    else
      redirect_to("/journals", { :alert => the_journal.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_journal = Journal.where({ :id => the_id }).at(0)

    the_journal.content = params.fetch("query_content")
    the_journal.title = params.fetch("query_title")
    the_journal.mood = params.fetch("query_mood")
    the_journal.weather = params.fetch("query_weather")
    the_journal.date = params.fetch("query_date")
    the_journal.author_id = params.fetch("query_author_id")
    the_journal.image = params.fetch("query_image")

    if the_journal.valid?
      the_journal.save
      redirect_to("/journals/#{the_journal.id}", { :notice => "Journal updated successfully." })
    else
      redirect_to("/journals/#{the_journal.id}", { :alert => the_journal.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_journal = Journal.where({ :id => the_id }).at(0)

    the_journal.destroy

    redirect_to("/journals", { :notice => "Journal deleted successfully." })
  end
end
