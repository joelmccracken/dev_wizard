defmodule DevWizard.Router do
  use DevWizard.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DevWizard do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", PageController, :login
    get "/oauth_callback", PageController, :oauth_callback
    get "/my_code_reviews", PageController, :my_code_reviews
    get "/needs_review", PageController, :needs_review
    get "/needs_qa", PageController, :needs_qa
    get "/needs_release_notes", PageController, :needs_release_notes
  end

  # Other scopes may use custom stacks.
  # scope "/api", DevWizard do
  #   pipe_through :api
  # end
end
