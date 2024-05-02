defmodule QuizzeWeb.Router do
  use QuizzeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {QuizzeWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
end
