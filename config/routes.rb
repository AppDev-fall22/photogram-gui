Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})

  get("/", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "show"})

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:path_id", { :controller => "photos", :action => "show"})

  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete"})

  get("/update_photo/:path_id", { :controller => "photos", :action => "edit"})

  get("/insert_photo_record", { :controller => "photos", :action => "create"})

  get("/insert_comment_record", { :controller => "photos", :action => "new_comment"})

  get("/update_user/:path_id", { :controller => "users", :action => "update_user"})

  get("/insert_user_record", { :controller => "users", :action => "new_user"})
end
