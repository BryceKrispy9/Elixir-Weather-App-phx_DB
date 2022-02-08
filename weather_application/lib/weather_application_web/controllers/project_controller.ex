defmodule WeatherApplicationWeb.ProjectController do
  use WeatherApplicationWeb, :controller

  alias WeatherApplication.Weather
  alias WeatherApplication.Weather.Project

  action_fallback WeatherApplicationWeb.FallbackController

  def index(conn, _params) do
    projects = Weather.list_projects()
    render(conn, "index.json", projects: projects)
  end

  def create(conn, %{"project" => project_params}) do
    with {:ok, %Project{} = project} <- Weather.create_project(project_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.project_path(conn, :show, project))
      |> render("show.json", project: project)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Weather.get_project!(id)
    render(conn, "show.json", project: project)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Weather.get_project!(id)

    with {:ok, %Project{} = project} <- Weather.update_project(project, project_params) do
      render(conn, "show.json", project: project)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Weather.get_project!(id)

    with {:ok, %Project{}} <- Weather.delete_project(project) do
      send_resp(conn, :no_content, "")
    end
  end
end
