defmodule UpiicsagenerarcredencialWeb.PageController do
  use UpiicsagenerarcredencialWeb, :controller
  def index(conn, _params) do
    render conn, "index.html"
  end
end
