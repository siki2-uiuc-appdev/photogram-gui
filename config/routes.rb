Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "index" })
  get("/users", { :controller => 'users', :action => "index"})
  
  get("/users/:path_username", { :controller => 'users', :action => "show"})

  get("/photos", { :controller => 'photos', :action => "index"})
  get("/photos/:path_id", { :controller => 'photos', :action => "show"})
  get("/insert_photo", { :controller => 'photos', :action => "create"})
  get("/add_comment", { :controller => 'photos', :action => "add_comment"})
  get("/update_photo/:modify_id", { :controller => 'photos', :action => "update"})
  get("/delete_photo/:toast_id", { :controller => 'photos', :action => "delete"})

end
