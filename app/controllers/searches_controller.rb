class SearchesController < ApplicationController
  before_action :current_user_must_be_search_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_search_user
    search = Search.find(params[:id])

    unless current_user == search.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Search.ransack(params[:q])
    @searches = @q.result(:distinct => true).includes(:user, :cta_searches, :metra_searches, :hood_searches, :city_searches, :listings_searches, :listings, :cta_stations, :metra_stations, :cities, :neighborhoods).page(params[:page]).per(10)

    render("searches/index.html.erb")
  end

  def show
    @listings_search = ListingsSearch.new
    @city_search = CitySearch.new
    @hood_search = HoodSearch.new
    @metra_search = MetraSearch.new
    @cta_search = CtaSearch.new
    @search = Search.find(params[:id])

    render("searches/show.html.erb")
  end

  def new
    @search = Search.new

    render("searches/new.html.erb")
  end

  def create
    @search = Search.new

    @search.user_id = params[:user_id]
    @search.property_type = params[:property_type]
    @search.beds = params[:beds]
    @search.baths = params[:baths]
    @search.max_price = params[:max_price]
    @search.rental = params[:rental]
    @search.cats = params[:cats]
    @search.dogs = params[:dogs]
    @search.cta_distance = params[:cta_distance]
    @search.metra_distance = params[:metra_distance]
    @search.parking = params[:parking]
    @search.laundry = params[:laundry]
    @search.name = params[:name]
    @search.min_price = params[:min_price]
    @search.old_mlsids = params[:old_mlsids]
    @search.current_mlsids = params[:current_mlsids]
    @search.new_mlsids = params[:new_mlsids]

    save_status = @search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/searches/new", "/create_search"
        redirect_to("/searches")
      else
        redirect_back(:fallback_location => "/", :notice => "Search created successfully.")
      end
    else
      render("searches/new.html.erb")
    end
  end

  def edit
    @search = Search.find(params[:id])

    render("searches/edit.html.erb")
  end

  def update
    @search = Search.find(params[:id])
    @search.property_type = params[:property_type]
    @search.beds = params[:beds]
    @search.baths = params[:baths]
    @search.max_price = params[:max_price]
    @search.rental = params[:rental]
    @search.cats = params[:cats]
    @search.dogs = params[:dogs]
    @search.cta_distance = params[:cta_distance]
    @search.metra_distance = params[:metra_distance]
    @search.parking = params[:parking]
    @search.laundry = params[:laundry]
    @search.name = params[:name]
    @search.min_price = params[:min_price]
    @search.old_mlsids = params[:old_mlsids]
    @search.current_mlsids = params[:current_mlsids]
    @search.new_mlsids = params[:new_mlsids]

    save_status = @search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/searches/#{@search.id}/edit", "/update_search"
        redirect_to("/searches/#{@search.id}", :notice => "Search updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Search updated successfully.")
      end
    else
      render("searches/edit.html.erb")
    end
  end

  def destroy
    @search = Search.find(params[:id])

    @search.destroy

    if URI(request.referer).path == "/searches/#{@search.id}"
      redirect_to("/", :notice => "Search deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Search deleted.")
    end
  end
end
