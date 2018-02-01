class HoodSearchesController < ApplicationController
  def index
    @q = HoodSearch.ransack(params[:q])
    @hood_searches = @q.result(:distinct => true).includes(:search, :neighborhood).page(params[:page]).per(10)

    render("hood_searches/index.html.erb")
  end

  def show
    @hood_search = HoodSearch.find(params[:id])

    render("hood_searches/show.html.erb")
  end

  def new
    @hood_search = HoodSearch.new

    render("hood_searches/new.html.erb")
  end

  def create
    @hood_search = HoodSearch.new

    @hood_search.neighborhood_id = params[:neighborhood_id]
    @hood_search.search_id = params[:search_id]

    save_status = @hood_search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hood_searches/new", "/create_hood_search"
        redirect_to("/hood_searches")
      else
        redirect_back(:fallback_location => "/", :notice => "Hood search created successfully.")
      end
    else
      render("hood_searches/new.html.erb")
    end
  end

  def edit
    @hood_search = HoodSearch.find(params[:id])

    render("hood_searches/edit.html.erb")
  end

  def update
    @hood_search = HoodSearch.find(params[:id])

    @hood_search.neighborhood_id = params[:neighborhood_id]
    @hood_search.search_id = params[:search_id]

    save_status = @hood_search.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hood_searches/#{@hood_search.id}/edit", "/update_hood_search"
        redirect_to("/hood_searches/#{@hood_search.id}", :notice => "Hood search updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Hood search updated successfully.")
      end
    else
      render("hood_searches/edit.html.erb")
    end
  end

  def destroy
    @hood_search = HoodSearch.find(params[:id])

    @hood_search.destroy

    if URI(request.referer).path == "/hood_searches/#{@hood_search.id}"
      redirect_to("/", :notice => "Hood search deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Hood search deleted.")
    end
  end
end
