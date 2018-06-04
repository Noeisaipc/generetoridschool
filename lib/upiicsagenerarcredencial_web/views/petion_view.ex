defmodule UpiicsagenerarcredencialWeb.PetionView do
  use UpiicsagenerarcredencialWeb, :view
  alias UpiicsagenerarcredencialWeb.PetionView

  def render("index.json", %{petions: petions}) do
    %{data: render_many(petions, PetionView, "petion.json")}
  end

  def render("show.json", %{petion: petion}) do
    %{data: render_one(petion, PetionView, "petion.json")}
  end

  def render("petion.json", %{petion: petion}) do
    %{id: petion.id,
      boleta: petion.boleta,
      estado: petion.estado,
      id_transacion: petion.id_transacion,
      id_constancia: petion.id_constancia}
  end
end
