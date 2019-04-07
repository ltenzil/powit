defmodule PowitWeb.PowMailer do
  use Pow.Phoenix.Mailer
  use Swoosh.Mailer, otp_app: :powit

  import Swoosh.Email

  require Logger

  def cast(%{user: user, subject: subject, text: text, html: html, assigns: _assigns}) do
    # Build email struct to be used in `process/1`

    %Swoosh.Email{}
    |> to({"", user.email})
    |> from({"My App", "pwer@powit.com"})
    |> subject(subject)
    |> html_body(html)
    |> text_body(text)
  end

  def process(email) do
    # Send email
    deliver(email, Application.get_env(:powit, PowitWeb.Mailer))
    Logger.debug("E-mail sent: #{inspect email}")
  end
end
