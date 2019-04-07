defmodule PowitWeb.PowResetPassword.MailerView do
  use PowitWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
