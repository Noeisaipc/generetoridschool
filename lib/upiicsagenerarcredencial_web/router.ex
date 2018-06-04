defmodule UpiicsagenerarcredencialWeb.Router do
  use UpiicsagenerarcredencialWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug UserApiWeb.Authentication
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UpiicsagenerarcredencialWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/reponercredencial/", CredentialController, :index
    post "/reponercredencial/start/", CredentialController, :geneterate_order
    post "/reponercredencial/pago", CredentialController, :register_payment
    post "/reponercredencial/constancia", CredentialController, :register_constancia
    post "/reponercredencial/terminalconstancia", CredentialController, :register_confirmation
    resources "/alumno", AlumnoController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  scope "/api", UpiicsagenerarcredencialWeb do
     pipe_through :api
     resources "/petions", PetionController, except: [:new, :edit]
  end
end
