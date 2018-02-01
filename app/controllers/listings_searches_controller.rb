class ListingsSearchesController < ApplicationController
  def index
    @q = ListingsSearch.ransack(params[:q])
    @listings_searches = @q.result(:distinct => true).includes(:listing, :search).page(params[:page]).per(10)

    render("listings_searches/index.html.erb")
  end

  def show
    @listings_search = ListingsSearch.find(params[:id])

    render("listings_searches/show.html.erb")
  end

  def new
    @listings_search = ListingsSearch.new

    render("listings_searches/new.html.erb")
  end

  def create
    @listings_search = ListingsSearch.new

    @listings_search.listing_id = params[:listing_id]
    @listings_search.search_id = params[:search_id]

    save_status = @listings_search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/listings_searches/new", "/create_listings_search"
        redirect_to("/listings_searches")
      else
        redirect_back(:fallback_location => "/", :notice => "Listings search created successfully.")
      end
    else
      render("listings_searches/new.html.erb")
    end
  end

  def edit
    @listings_search = ListingsSearch.find(params[:id])

    render("listings_searches/edit.html.erb")
  end

  def update
    @listings_search = ListingsSearch.find(params[:id])

    @listings_search.listing_id = params[:listing_id]
    @listings_search.search_id = params[:search_id]

    save_status = @listings_search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/listings_searches/#{@listings_search.id}/edit", "/update_listings_search"
        redirect_to("/listings_searches/#{@listings_search.id}", :notice => "Listings search updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Listings search updated successfully.")
      end
    else
      render("listings_searches/edit.html.erb")
    end
  end

  def destroy
    @listings_search = ListingsSearch.find(params[:id])

    @listings_search.destroy

    if URI(request.referer).path == "/listings_searches/#{@listings_search.id}"
      redirect_to("/", :notice => "Listings search deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Listings search deleted.")
    end
  end
end
