defmodule ArcaptchaTest do
  use ExUnit.Case
  doctest Arcaptcha

  setup_all do
    [
      verify_url: "https://api.arcaptcha.ir/arcaptcha/api/verify",
      site_key: "YOUR_SITE_KEY",
      secret_key: "YOUR_SECRET_KEY",
      good_response: "{\"success\":true}\n",
      bad_response: "{\"status\":404,\"message\":\"Challenge not exist\"}\n"
    ]
  end

  test "Verify good response", context do
    assert context[:good_response] |> Arcaptcha.validate_response()
  end

  test "Verify bad response", context do
    refute context[:bad_response] |> Arcaptcha.validate_response()
  end

  test "Should display script tag" do
    assert Arcaptcha.display_tag() |> String.length() > 0
  end

  test "Should display captcha HTML tag", context do
    assert context[:site_key] |> Arcaptcha.display() |> String.length() > 0
  end
end
