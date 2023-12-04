Rails.application.routes.draw do
  # get("/", { :controller => "users", :action => "index" })
  root to: "courses#index"
  # Routes for the Homework resource:

  # CREATE
  post("/insert_homework", { :controller => "homeworks", :action => "create" })
          
  # READ
  get("/homeworks", { :controller => "homeworks", :action => "index" })
  
  get("/homeworks/:path_id", { :controller => "homeworks", :action => "show" })

  get("/insert_homework_page", { :controller => "homeworks", :action => "insert_page" })

  get("/homeworks/update_page/:path_id", { :controller => "homeworks", :action => "update_page" })
  
  # UPDATE
  
  post("/modify_homework/:path_id", { :controller => "homeworks", :action => "update" })
  
  # DELETE
  get("/delete_homework/:path_id", { :controller => "homeworks", :action => "destroy" })

  #------------------------------

  # Routes for the Note resource:

  # CREATE
  post("/insert_note", { :controller => "notes", :action => "create" })
          
  # READ
  get("/notes", { :controller => "notes", :action => "index" })
  
  get("/notes/:path_id", { :controller => "notes", :action => "show" })

  get("/insert_note_page", { :controller => "notes", :action => "insert_page" })

  get("/notes/update_page/:path_id", { :controller => "notes", :action => "update_page" })
  
  # UPDATE
  
  post("/modify_note/:path_id", { :controller => "notes", :action => "update" })
  
  # DELETE
  get("/delete_note/:path_id", { :controller => "notes", :action => "destroy" })

  #------------------------------

  # Routes for the Journal resource:

  # CREATE
  post("/insert_journal", { :controller => "journals", :action => "create" })
          
  # READ
  get("/journals/insert_page", { :controller => "journals", :action => "insert_page" })

  get("/journals/update_page/:path_id", { :controller => "journals", :action => "update_page" })

  get("/journals", { :controller => "journals", :action => "index" })
  
  get("/journals/:path_id", { :controller => "journals", :action => "show" })
  
  # UPDATE
  
  post("/modify_journal/:path_id", { :controller => "journals", :action => "update" })
  
  # DELETE
  get("/delete_journal/:path_id", { :controller => "journals", :action => "destroy" })

  #------------------------------

  # Routes for the Course resource:

  # CREATE
  post("/insert_course", { :controller => "courses", :action => "create" })
          
  # READ
  get("/courses", { :controller => "courses", :action => "index" })
  
  get("/courses/:path_id", { :controller => "courses", :action => "show" })

  get("/insert_course_page", { :controller => "courses", :action => "insert" })

  get("/courses/update_page/:path_id", { :controller => "courses", :action => "update_page" })

  
  # UPDATE
  
  post("/modify_course/:path_id", { :controller => "courses", :action => "update" })
  
  # DELETE
  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  #------------------------------

  # Routes for the User resource:

  # CREATE
  post("/insert_user", { :controller => "users", :action => "create" })
          
  # READ
  get("/users", { :controller => "users", :action => "index" })
  
  get("/users/:path_id", { :controller => "users", :action => "show" })
  
  # UPDATE
  
  post("/modify_user/:path_id", { :controller => "users", :action => "update" })
  
  # DELETE
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
