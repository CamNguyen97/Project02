class Admin::MoviesMovietypesController < Admin::ApplicationController
 before_action :movies_movietype_read, except: %W(index create new)
 before_action :search_duplicates, only: %W(create update)
  def index
    @movies_movietypes = MoviesMovietype.all
  end

  def create
    if @search_duplicate.empty?
      if @movies_movietype.save
        flash[:success] = t "new_suscess"
        redirect_to admin_movies_movietypes_path
      else
        flash[:danger] =  t "danger"
        redirect_to admin_movies_movietypes_path
      end
    else
      flash[:danger] =  t "data_used"
      redirect_to admin_movies_movietypes_path
    end
  end

  def new
    @movies_movietype = MoviesMovietype.new
    @list_movie = Movie.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
    @list_movietype = Movietype.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
  end

  def edit
    @list_movie = Movie.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
    @list_movietype = Movietype.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
  end
  
  def update
    if @movies_movietype.update_attributes movies_movietype_params
      flash[:success] = t "update_suscess"
      redirect_to admin_movies_movietypes_path
    else
      flash[:danger] =  t "danger"
      redirect_to admin_movies_movietypes_path
    end
  end

  def delete
    @movies_movietype_d = MoviesMovietype.find_by id: params[:movies_movietype_id]
  end

  def destroy
    MoviesMovietype.find(params[:id]).destroy
    flash[:success] = t "delete"
    redirect_to admin_movies_movietypes_path
  end


  private

  def movies_movietype_params
    params.require(:movies_movietype).permit  :movie_id, :movietype_id
  end

  def movies_movietype_read
    @movies_movietype = MoviesMovietype.find_by id: params[:id]
  end

  def search_duplicates
    @movies_movietype = MoviesMovietype.new movies_movietype_params
    @search_duplicate = MoviesMovietype.select("*")
      .where("movies_movietypes.movie_id=? and movies_movietypes.movietype_id=? ", @movies_movietype.movie_id, @movies_movietype.movietype_id)
  end
end