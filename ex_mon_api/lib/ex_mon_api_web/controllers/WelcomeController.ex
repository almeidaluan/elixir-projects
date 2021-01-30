defmodule ExMonApiWeb.WelcomeController do
  use ExMonApiWeb, :controller

  def index(conn, _params) do
    text(conn,"Welcome to the ExMonApi with Elixir")
  end

end
