defmodule ElixirProject.PageController do
  use ElixirProject.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
