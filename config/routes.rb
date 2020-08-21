Rails.application.routes.draw do



  # Routes for the Gathering resource:

  # CREATE
  post("/insert_gathering", { :controller => "gatherings", :action => "create" })
          
  # READ
  get("/gatherings", { :controller => "gatherings", :action => "index" })
  
  get("/gatherings/:path_id", { :controller => "gatherings", :action => "show" })
  
  # UPDATE
  
  post("/modify_gathering/:path_id", { :controller => "gatherings", :action => "update" })
  
  # DELETE
  get("/delete_gathering/:path_id", { :controller => "gatherings", :action => "destroy" })

  #------------------------------

  # Routes for the Drink resource:

  # CREATE
  post("/insert_drink", { :controller => "drinks", :action => "create" })
          
  # READ
  get("/drinks", { :controller => "drinks", :action => "index" })
  
  get("/drinks/:path_id", { :controller => "drinks", :action => "show" })
  
  # UPDATE
  
  post("/modify_drink/:path_id", { :controller => "drinks", :action => "update" })
  
  # DELETE
  get("/delete_drink/:path_id", { :controller => "drinks", :action => "destroy" })

  #------------------------------

  # Routes for the Food resource:

  # CREATE
  post("/insert_food", { :controller => "foods", :action => "create" })
          
  # READ
  get("/foods", { :controller => "foods", :action => "index" })
  
  get("/foods/:path_id", { :controller => "foods", :action => "show" })
  
  # UPDATE
  
  post("/modify_food/:path_id", { :controller => "foods", :action => "update" })
  
  # DELETE
  get("/delete_food/:path_id", { :controller => "foods", :action => "destroy" })

  #------------------------------

  # Routes for the Party resource:

  # CREATE
  post("/insert_party", { :controller => "parties", :action => "create" })
          
  # READ
  get("/parties", { :controller => "parties", :action => "index" })
  
  get("/parties/:path_id", { :controller => "parties", :action => "show" })
  
  # UPDATE
  
  post("/modify_party/:path_id", { :controller => "parties", :action => "update" })
  
  # DELETE
  get("/delete_party/:path_id", { :controller => "parties", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
