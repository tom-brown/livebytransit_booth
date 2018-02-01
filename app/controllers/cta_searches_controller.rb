class CtaSearchesController < ApplicationController
  def index
    @q = CtaSearch.ransack(params[:q])
    @cta_searches = @q.result(:distinct => true).includes(:search, :cta_station).page(params[:page]).per(10)

    render("cta_searches/index.html.erb")
  end

  def show
    @cta_search = CtaSearch.find(params[:id])

    render("cta_searches/show.html.erb")
  end

  def new
    @cta_search = CtaSearch.new

    render("cta_searches/new.html.erb")
  end

  def create
    @cta_search = CtaSearch.new

    @cta_search.search_id = params[:search_id]
    @cta_search.cta_station_id = params[:cta_station_id]

    save_status = @cta_search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cta_searches/new", "/create_cta_search"
        redirect_to("/cta_searches")
      else
        redirect_back(:fallback_location => "/", :notice => "Cta search created successfully.")
      end
    else
      render("cta_searches/new.html.erb")
    end
  end

  def edit
    @cta_search = CtaSearch.find(params[:id])

    render("cta_searches/edit.html.erb")
  end

  def update
    @cta_search = CtaSearch.find(params[:id])

    @cta_search.search_id = params[:search_id]
    @cta_search.cta_station_id = params[:cta_station_id]

    save_status = @cta_search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cta_searches/#{@cta_search.id}/edit", "/update_cta_search"
        redirect_to("/cta_searches/#{@cta_search.id}", :notice => "Cta search updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cta search updated successfully.")
      end
    else
      render("cta_searches/edit.html.erb")
    end
  end

  def destroy
    @cta_search = CtaSearch.find(params[:id])

    @cta_search.destroy

    if URI(request.referer).path == "/cta_searches/#{@cta_search.id}"
      redirect_to("/", :notice => "Cta search deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cta search deleted.")
    end
  end
end
