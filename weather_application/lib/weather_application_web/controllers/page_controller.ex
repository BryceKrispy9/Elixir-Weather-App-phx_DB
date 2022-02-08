defmodule WeatherApplicationWeb.PageController do
  use WeatherApplicationWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
