class MetraSearchesController < ApplicationController
  def index
    @q = MetraSearch.ransack(params[:q])
    @metra_searches = @q.result(:distinct => true).includes(:search, :metra_station).page(params[:page]).per(10)

    render("metra_searches/index.html.erb")
  end

  def show
    @metra_search = MetraSearch.find(params[:id])

    render("metra_searches/show.html.erb")
  end

  def new
    @metra_search = MetraSearch.new

    render("metra_searches/new.html.erb")
  end

  def create
    @metra_search = MetraSearch.new

    @metra_search.search_id = params[:search_id]
    @metra_search.metra_station_id = params[:metra_station_id]

    save_status = @metra_search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/metra_searches/new", "/create_metra_search"
        redirect_to("/metra_searches")
      else
        redirect_back(:fallback_location => "/", :notice => "Metra search created successfully.")
      end
    else
      render("metra_searches/new.html.erb")
    end
  end

  def edit
    @metra_search = MetraSearch.find(params[:id])

    render("metra_searches/edit.html.erb")
  end

  def update
    @metra_search = MetraSearch.find(params[:id])

    @metra_search.search_id = params[:search_id]
    @metra_search.metra_station_id = params[:metra_station_id]

    save_status = @metra_search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/metra_searches/#{@metra_search.id}/edit", "/update_metra_search"
        redirect_to("/metra_searches/#{@metra_search.id}", :notice => "Metra search updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Metra search updated successfully.")
      end
    else
      render("metra_searches/edit.html.erb")
    end
  end

  def destroy
    @metra_search = MetraSearch.find(params[:id])

    @metra_search.destroy

    if URI(request.referer).path == "/metra_searches/#{@metra_search.id}"
      redirect_to("/", :notice => "Metra search deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Metra search deleted.")
    end
  end
end
