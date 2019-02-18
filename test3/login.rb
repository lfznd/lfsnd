class LoginCrossEdit
  include Capybara::DSL

  def do_login(username, password)
   
        fill_in("email", with: "********")
        fill_in("password", with: "********")
        click_button "Log In"
   end
end

