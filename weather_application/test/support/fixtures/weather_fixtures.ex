defmodule WeatherApplication.WeatherFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WeatherApplication.Weather` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> WeatherApplication.Weather.create_project()

    project
  end
end
