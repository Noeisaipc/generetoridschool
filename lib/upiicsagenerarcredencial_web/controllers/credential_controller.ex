defmodule UpiicsagenerarcredencialWeb.CredentialController do
    use UpiicsagenerarcredencialWeb, :controller

    alias Upiicsagenerarcredencial.Accounts
    alias Upiicsagenerarcredencial.Requests
    alias Upiicsagenerarcredencial.Requests.Petion
    
  
    def index(conn,_params) do
      with {:ok, status} <- Accounts.get_status_by_boleta(conn.assigns.current_user.boleta) do  
        case Requests.get_status(conn.assigns.current_user.boleta) do
          {:ok, 0} -> 
            conn
            |>render("pago.html")
          {:ok, 1} ->
            conn
            |>render("constancia.html")
          {:ok, 2} ->
            conn
            |>render("confimarcion.html")
          {:ok, 3} ->
            conn
            |>render("finish.html")
          {:error,error} ->
            conn
            |> render("index.html", %{status: status})
        end
      else
        {:error, error} ->
          conn
            |> put_flash(:error, "Debes Iniciar Sesion si Quieres Reponer Credencial")
            |> redirect(to: page_path(conn, :index))
      end
    end

    def geneterate_order(conn,_params) do
      initial_petion = %Petion{boleta: conn.assigns.current_user.boleta}
      with {:ok, petion} <- Requests.create(initial_petion) do
        conn
        |> put_status(202)
        |> render("pago.html")
      else 
        {:error,_} ->
          conn
          |> put_flash(:info, "Ya estabas realizando tu proceso de reposicion") 
          |>redirect(to: credential_path(conn, :index))
      end
    end

    def register_payment(conn,_params) do
        with {:ok, petion} <- Requests.update_petion_pago(conn.assigns.current_user.boleta,1) do
          conn
          |> put_status(202)
          |> put_flash(:info, "Se Actualizo") 
          |> render("constancia.html")
        else
          {:error, error} ->
            conn
            |> put_flash(:info, "No se actualizo") 
            |> render("constancia.html")
        end
    end

    def register_constancia(conn,_params) do
        with {:ok, petion} <- Requests.update_petion_constancia(conn.assigns.current_user.boleta,2) do
          conn
          |> put_status(202)
          |> put_flash(:info, "Se Actualizo") 
          |> render("confimarcion.html")
        else
          {:error, error} ->
            conn
            |> put_flash(:info, "No se actualizo") 
            |> render("constancia.html")
        end
    end

    def register_confirmation(conn,_params) do
      with {:ok, petion} <- Requests.update_petion_process(conn.assigns.current_user.boleta,3) do
        conn
        |> put_status(202)
        |> put_flash(:info, "Se Actualizo") 
        |> render("finish.html")
      else
        {:error, error} ->
          conn
          |> put_flash(:info, "No se actualizo") 
          |> render("constancia.html")
      end
    end

end
  