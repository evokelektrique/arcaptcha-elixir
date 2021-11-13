<h1>
  <img src="https://arcaptcha.ir/logo.png" width="80" />
  Arcaptcha
</h1>

Validate and display captcha from Arcaptcha easily in Elixir. ([documentation](https://hexdocs.pm/arcaptcha/Arcaptcha.html#content))

## Installation

The package can be installed by adding `arcaptcha` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:arcaptcha, "~> 1.0.0"}
  ]
end
```

## Usage

```elixir
# Verify challenge
iex> Arcaptcha.verify("site_key", "secret_key", "challenge_id")
true

# Display API script tag
iex> Arcaptcha.display_tag()
"<script src='https://widget.arcaptcha.ir/1/api.js' async defer></script>"

# Display captcha HTML tag
iex> Arcaptcha.display("my_site_key")
"<div class='arcaptcha' data-site-key='my_site_key'></div>"
```
