class CitiesController < ApplicationController
  def index
    @q = City.ransack(params[:q])
    @cities = @q.result(:distinct => true).includes(:neighborhoods, :city_searches, :listings, :searches).page(params[:page]).per(10)

    render("cities/index.html.erb")
  end

  def show
    @listing = Listing.new
    @city_search = CitySearch.new
    @neighborhood = Neighborhood.new
    @city = City.find(params[:id])

    render("cities/show.html.erb")
  end

  def new
    @city = City.new

    render("cities/new.html.erb")
  end

  def create
    @city = City.new

    @city.name = params[:name]

    save_status = @city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cities/new", "/create_city"
        redirect_to("/cities")
      else
        redirect_back(:fallback_location => "/", :notice => "City created successfully.")
      end
    else
      render("cities/new.html.erb")
    end
  end

  def edit
    @city = City.find(params[:id])

    render("cities/edit.html.erb")
  end

  def update
    @city = City.find(params[:id])

    @city.name = params[:name]

    save_status = @city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cities/#{@city.id}/edit", "/update_city"
        redirect_to("/cities/#{@city.id}", :notice => "City updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "City updated successfully.")
      end
    else
      render("cities/edit.html.erb")
    end
  end

  def destroy
    @city = City.find(params[:id])

    @city.destroy

    if URI(request.referer).path == "/cities/#{@city.id}"
      redirect_to("/", :notice => "City deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "City deleted.")
    end
  end
end
