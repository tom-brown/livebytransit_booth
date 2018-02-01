class CitySearchesController < ApplicationController
  def index
    @q = CitySearch.ransack(params[:q])
    @city_searches = @q.result(:distinct => true).includes(:search, :city).page(params[:page]).per(10)

    render("city_searches/index.html.erb")
  end

  def show
    @city_search = CitySearch.find(params[:id])

    render("city_searches/show.html.erb")
  end

  def new
    @city_search = CitySearch.new

    render("city_searches/new.html.erb")
  end

  def create
    @city_search = CitySearch.new

    @city_search.search_id = params[:search_id]
    @city_search.city_id = params[:city_id]

    save_status = @city_search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/city_searches/new", "/create_city_search"
        redirect_to("/city_searches")
      else
        redirect_back(:fallback_location => "/", :notice => "City search created successfully.")
      end
    else
      render("city_searches/new.html.erb")
    end
  end

  def edit
    @city_search = CitySearch.find(params[:id])

    render("city_searches/edit.html.erb")
  end

  def update
    @city_search = CitySearch.find(params[:id])

    @city_search.search_id = params[:search_id]
    @city_search.city_id = params[:city_id]

    save_status = @city_search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/city_searches/#{@city_search.id}/edit", "/update_city_search"
        redirect_to("/city_searches/#{@city_search.id}", :notice => "City search updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "City search updated successfully.")
      end
    else
      render("city_searches/edit.html.erb")
    end
  end

  def destroy
    @city_search = CitySearch.find(params[:id])

    @city_search.destroy

    if URI(request.referer).path == "/city_searches/#{@city_search.id}"
      redirect_to("/", :notice => "City search deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "City search deleted.")
    end
  end
end
