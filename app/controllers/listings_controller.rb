class ListingsController < ApplicationController
  # before_action :current_user_must_be_listing_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_listing_user
    listing = Listing.find(params[:id])

    unless current_user == listing.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.listings.ransack(params[:q])
      @listings = @q.result(:distinct => true).includes(:favorites, :showings, :listings_searches, :user, :city, :neighborhood, :searches).page(params[:page]).per(10)

    render("listings/index.html.erb")
  end

  def show
    @listings_search = ListingsSearch.new
    @showing = Showing.new
    @favorite = Favorite.new
    @listing = Listing.find(params[:id])

    render("listings/show.html.erb")
  end

  def new
    @listing = Listing.new

    render("listings/new.html.erb")
  end

  def create
    @listing = Listing.new

    @listing.address = params[:address]
    @listing.lat = params[:lat]
    @listing.lng = params[:lng]
    @listing.user_id = params[:user_id]
    @listing.beds = params[:beds]
    @listing.baths = params[:baths]
    @listing.half_baths = params[:half_baths]
    @listing.description = params[:description]
    @listing.garage_spaces = params[:garage_spaces]
    @listing.assigned_parking = params[:assigned_parking]
    @listing.active = params[:active]
    @listing.age = params[:age]
    @listing.size = params[:size]
    @listing.city_id = params[:city_id]
    @listing.heat_gas = params[:heat_gas]
    @listing.heat_radiator = params[:heat_radiator]
    @listing.ac_window_units = params[:ac_window_units]
    @listing.ac_central = params[:ac_central]
    @listing.list_date = params[:list_date]
    @listing.pin = params[:pin]
    @listing.recent_rehab = params[:recent_rehab]
    @listing.vintage = params[:vintage]
    @listing.new_construction = params[:new_construction]
    @listing.price = params[:price]
    @listing.rental = params[:rental]
    @listing.state = params[:state]
    @listing.st_num = params[:st_num]
    @listing.street = params[:street]
    @listing.st_suffix = params[:st_suffix]
    @listing.cp = params[:cp]
    @listing.unit = params[:unit]
    @listing.zip_code = params[:zip_code]
    @listing.property_type = params[:property_type]
    @listing.laundry = params[:laundry]
    @listing.cats = params[:cats]
    @listing.dogs = params[:dogs]
    @listing.available_date = params[:available_date]
    @listing.image_urls = params[:image_urls]
    @listing.neighborhood_id = params[:neighborhood_id]
    @listing.picture_count = params[:picture_count]
    @listing.mls_id = params[:mls_id]
    @listing.lo_mlsid = params[:lo_mlsid]
    @listing.la_first_name = params[:la_first_name]
    @listing.la_last_name = params[:la_last_name]
    @listing.total_baths = params[:total_baths]

    save_status = @listing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/listings/new", "/create_listing"
        redirect_to("/listings")
      else
        redirect_back(:fallback_location => "/", :notice => "Listing created successfully.")
      end
    else
      render("listings/new.html.erb")
    end
  end

  def edit
    @listing = Listing.find(params[:id])

    render("listings/edit.html.erb")
  end

  def update
    @listing = Listing.find(params[:id])

    @listing.address = params[:address]
    @listing.lat = params[:lat]
    @listing.lng = params[:lng]
    @listing.user_id = params[:user_id]
    @listing.beds = params[:beds]
    @listing.baths = params[:baths]
    @listing.half_baths = params[:half_baths]
    @listing.description = params[:description]
    @listing.garage_spaces = params[:garage_spaces]
    @listing.assigned_parking = params[:assigned_parking]
    @listing.active = params[:active]
    @listing.age = params[:age]
    @listing.size = params[:size]
    @listing.city_id = params[:city_id]
    @listing.heat_gas = params[:heat_gas]
    @listing.heat_radiator = params[:heat_radiator]
    @listing.ac_window_units = params[:ac_window_units]
    @listing.ac_central = params[:ac_central]
    @listing.list_date = params[:list_date]
    @listing.pin = params[:pin]
    @listing.recent_rehab = params[:recent_rehab]
    @listing.vintage = params[:vintage]
    @listing.new_construction = params[:new_construction]
    @listing.price = params[:price]
    @listing.rental = params[:rental]
    @listing.state = params[:state]
    @listing.st_num = params[:st_num]
    @listing.street = params[:street]
    @listing.st_suffix = params[:st_suffix]
    @listing.cp = params[:cp]
    @listing.unit = params[:unit]
    @listing.zip_code = params[:zip_code]
    @listing.property_type = params[:property_type]
    @listing.laundry = params[:laundry]
    @listing.cats = params[:cats]
    @listing.dogs = params[:dogs]
    @listing.available_date = params[:available_date]
    @listing.image_urls = params[:image_urls]
    @listing.neighborhood_id = params[:neighborhood_id]
    @listing.picture_count = params[:picture_count]
    @listing.mls_id = params[:mls_id]
    @listing.lo_mlsid = params[:lo_mlsid]
    @listing.la_first_name = params[:la_first_name]
    @listing.la_last_name = params[:la_last_name]
    @listing.total_baths = params[:total_baths]

    save_status = @listing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/listings/#{@listing.id}/edit", "/update_listing"
        redirect_to("/listings/#{@listing.id}", :notice => "Listing updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Listing updated successfully.")
      end
    else
      render("listings/edit.html.erb")
    end
  end

  def destroy
    @listing = Listing.find(params[:id])

    @listing.destroy

    if URI(request.referer).path == "/listings/#{@listing.id}"
      redirect_to("/", :notice => "Listing deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Listing deleted.")
    end
  end
end
