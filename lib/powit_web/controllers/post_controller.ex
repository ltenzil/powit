defmodule PowitWeb.PostController do
  use PowitWeb, :controller
  alias Powit.CMS
  alias Powit.CMS.Post

  import Logger

  def index(conn, _params) do
    posts = CMS.list_posts()
    Logger.info(inspect(Pow.Plug.current_user(conn)))
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    cuser = Pow.Plug.current_user(conn)
    new_post = CMS.build_user_post(cuser)
    render(conn, "new.html", changeset: new_post)
  end

  def create(conn, %{"post" => post_params}) do
    cuser = Pow.Plug.current_user(conn)
    case CMS.create_user_post(cuser, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = CMS.get_post!(id)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = CMS.get_user_post!(id)
    changeset = CMS.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = CMS.get_post!(id)

    case CMS.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = CMS.get_post!(id)
    {:ok, _post} = CMS.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
