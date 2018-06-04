defmodule UpiicsagenerarcredencialWeb.Mail do
    @moduledoc """
    Module for compose mails
    """
    import Bamboo.Email
    def welcome_email(email) do
      new_email()
      |> to(email)
      |> from("postmaster@sandbox15989b023c894bdeadadc25edd1e91de.mailgun.org")
      |> subject("Welcome")
      |> html_body("<strong>Welcome</strong>")
      |> text_body("Bienvenido")
    end
end