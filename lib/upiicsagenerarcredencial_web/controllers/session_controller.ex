defmodule UpiicsagenerarcredencialWeb.SessionController do
    use UpiicsagenerarcredencialWeb, :controller

    alias Upiicsagenerarcredencial.Accounts
  
    def new(conn, _params) do
        if conn.assigns.current_user do
            conn
            |>redirect(to: page_path(conn, :index))
          else
            conn
            |>render conn, "new.html"
        end
    end
    
    def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
        with {:ok, user} <- Accounts.login(user,pass) do
           UserApiWeb.Authentication.login(conn,user)
            |> put_flash(:info, "Welcome back!")
            |> redirect(to: page_path(conn, :index))
          else
            {:error, _} ->
                conn
                |> put_flash(:error, "Invalid username/password") 
                |> redirect(to: page_path(conn, :index))
        end
    end
    
    def delete(conn, _) do
        conn
        |> UserApiWeb.Authentication.logout()
        |> redirect(to: page_path(conn, :index))
    end

end