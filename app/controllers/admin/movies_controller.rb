class Admin::MoviesController < Admin::ApplicationController
	before_action :movie_read, except: %W(index create new)
  def index
  	@movies = Movie.all.where(is_delete: false)
  end

  def create
  	@movie = Movie.new movie_params
    if @movie.save
      flash[:success] = t "suscess"
      redirect_to admin_movies_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
  	@movie = Movie.new
    @list_studio = Studio.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
  end

  def edit
    @list_studio = Studio.all.where(is_delete: false).map { |lst| [lst.name, lst.id] }
  end
  
  def update
  	if @movie.update_attributes movie_params
      flash[:success] = t "suscess"
      redirect_to admin_movies_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def delete
     @movie_d = Movie.find_by id: params[:movie_id]
  end

  def destroy
     @movie_d = Movie.find_by id: params[:id]
     if @movie_d.update_attributes is_delete:true
     flash[:success] = t "suscess"
      redirect_to admin_movies_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end


  private

  def movie_params
  	params.require(:movie).permit :name, :year_produced, :broadcasting_time, :descreption, :trailer, :image, :status, :studio_id
  end

  def movie_read
  	@movie = Movie.find_by id: params[:id]
  end
end