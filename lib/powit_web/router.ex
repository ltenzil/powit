defmodule PowitWeb.Router do
  use PowitWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router, otp_app: :powit

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  if Mix.env == :dev do
    scope "/dev" do
      pipe_through [:browser]

      forward "/mailbox", Plug.Swoosh.MailboxPreview, [base_path: "/dev/mailbox"]
    end
  end

  scope "/" do
    pipe_through :browser
    pow_routes()
    pow_extension_routes()
  end

  #protected routes
  scope "/", PowitWeb do
    pipe_through [:browser, :protected]
    get "/", PostController, :index

    resources "/posts", PostController do
      resources "/comments", CommentController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", PowitWeb do
  #   pipe_through :api
  # end
end
