defmodule WeatherCalls do
  use HTTPoison.Base

  def request(:get, url, params) do

  end

  @expected_fields ~w(
    consolidated_weather weather_state_name max_temp
  )

  def process_request_url(url) do
    "https://www.metaweather.com/api/location/2487610/" <> url
  end

  def process_request_url(url) do
    "https://www.metaweather.com/api/location/2442047/" <> url
  end

  def process_request_url(url) do
    "https://www.metaweather.com/api/location/2366355/" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
