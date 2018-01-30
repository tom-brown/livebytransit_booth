class MetraStationsController < ApplicationController
  def index
    @q = MetraStation.ransack(params[:q])
    @metra_stations = @q.result(:distinct => true).includes(:metra_assigns, :metra_searches, :searches, :metra_lines).page(params[:page]).per(10)

    render("metra_stations/index.html.erb")
  end

  def show
    @metra_search = MetraSearch.new
    @metra_assign = MetraAssign.new
    @metra_station = MetraStation.find(params[:id])

    render("metra_stations/show.html.erb")
  end

  def new
    @metra_station = MetraStation.new

    render("metra_stations/new.html.erb")
  end

  def create
    @metra_station = MetraStation.new

    @metra_station.lat = params[:lat]
    @metra_station.lng = params[:lng]

    save_status = @metra_station.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/metra_stations/new", "/create_metra_station"
        redirect_to("/metra_stations")
      else
        redirect_back(:fallback_location => "/", :notice => "Metra station created successfully.")
      end
    else
      render("metra_stations/new.html.erb")
    end
  end

  def edit
    @metra_station = MetraStation.find(params[:id])

    render("metra_stations/edit.html.erb")
  end

  def update
    @metra_station = MetraStation.find(params[:id])

    @metra_station.lat = params[:lat]
    @metra_station.lng = params[:lng]

    save_status = @metra_station.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/metra_stations/#{@metra_station.id}/edit", "/update_metra_station"
        redirect_to("/metra_stations/#{@metra_station.id}", :notice => "Metra station updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Metra station updated successfully.")
      end
    else
      render("metra_stations/edit.html.erb")
    end
  end

  def destroy
    @metra_station = MetraStation.find(params[:id])

    @metra_station.destroy

    if URI(request.referer).path == "/metra_stations/#{@metra_station.id}"
      redirect_to("/", :notice => "Metra station deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Metra station deleted.")
    end
  end
end
