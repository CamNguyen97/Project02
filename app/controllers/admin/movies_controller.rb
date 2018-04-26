class Admin::MoviesController < Admin::ApplicationController
	before_action :movie_read, except: %W(index create new)
  def index
  	@movies = Movie.all
  end

  def create
  	@movie = Movie.new movie_params
    if @movie.save
       flash[:suscces] = t "suscess"
      redirect_to admin_movies_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
  	@movie = Movie.new
    @list_studio = Studio.all.map { |lst| [lst.name, lst.id] }
  end

  def edit
  	@list_studio = Studio.all.map { |lst| [lst.name, lst.id] }
  end
  
  def update
  	if @movie.update_attributes movie_params
      flash[:suscces] = t "suscess"
      redirect_to admin_movies_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  	
  end

  private

  def movie_params
  	params.require(:movie).permit :name, :year_produced, :broadcasting_time, :descreption, :trailer, :image, :status, :studio_id
  end

  def movie_read
  	@movie = Movie.find_by id: params[:id]
  end
end