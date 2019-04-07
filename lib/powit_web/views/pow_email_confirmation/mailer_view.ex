defmodule PowitWeb.PowEmailConfirmation.MailerView do
  use PowitWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
