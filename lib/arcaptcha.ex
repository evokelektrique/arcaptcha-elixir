defmodule Arcaptcha do
  @moduledoc """
  Base module to verify and display Arcaptcha service captcha.
  """
  @verify_url "https://api.arcaptcha.ir/arcaptcha/api/verify"

  def verify, do: nil

  @doc """
    Returns verification status of `challenged_id` from `@verify_url`

    ## Examples

      iex> Arcaptcha.verify("site_key", "secret_key", "challenge_id")
      true
  """

  def verify(site_key, secret_key, challenge_id) do
    json_data =
      %{
        "site_key" => site_key,
        "secret_key" => secret_key,
        "challenge_id" => challenge_id
      }
      |> Jason.encode!()

    headers = [{"Content-Type", "application/json"}]

    case HTTPoison.post(@verify_url, json_data, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        validate_response(body)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        false
    end
  end

  def validate_response, do: nil

  @doc """
    Validates JSON response body from API

    ## Examples

      iex> Arcaptcha.validate_response("body")
      true
  """

  def validate_response(body) do
    case Jason.decode!(body) do
      %{"success" => true} ->
        true

      _ ->
        false
    end
  end

  @doc """
    Displays captcha HTML tag

    ## Examples

      iex> Arcaptcha.display("my_site_key")
      "<div class='arcaptcha' data-site-key='my_site_key'></div>"
  """

  def display(site_key) do
    "<div class='arcaptcha' data-site-key='#{site_key}'></div>"
  end

  @doc """
    Displays API script tag

    ## Examples

      iex> Arcaptcha.display_tag
      "<script src='https://widget.arcaptcha.ir/1/api.js' async defer></script>"
  """

  def display_tag do
    "<script src='https://widget.arcaptcha.ir/1/api.js' async defer></script>"
  end
end
