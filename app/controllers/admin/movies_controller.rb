class Admin::MoviesController < Admin::ApplicationController
	before_action :movie_read, except: %W(index create new)
  def index
  	@movies = Movie.all
  end

  def create
  	@movies = Movie.new movie_params
    if @movies.save
      redirect_to admin_movies_path
    else

    end
  end

  def new
  	@movies = Movie.new
  end

  def edit
  	
  end
  
 
  def update
  	
  end

  def destroy
  	
  end

  private

  def movie_params
  	params.require(:movie).permit :name, :year_produced, :broadcasting_time, :descreption, :trailer, :image, :status
  end

  def movie_read
  	@movie = Movie.find_by id: params[:id] if params[:id].empty?
  end
end