defmodule WeatherApplication.WeatherTest do
  use WeatherApplication.DataCase

  alias WeatherApplication.Weather

  describe "projects" do
    alias WeatherApplication.Weather.Project

    import WeatherApplication.WeatherFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Weather.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Weather.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Project{} = project} = Weather.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Weather.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Project{} = project} = Weather.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Weather.update_project(project, @invalid_attrs)
      assert project == Weather.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Weather.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Weather.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Weather.change_project(project)
    end
  end
end
