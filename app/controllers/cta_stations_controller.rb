class CtaStationsController < ApplicationController
  def index
    @q = CtaStation.ransack(params[:q])
    @cta_stations = @q.result(:distinct => true).includes(:cta_assigns, :cta_searches, :searches, :cta_lines).page(params[:page]).per(10)

    render("cta_stations/index.html.erb")
  end

  def show
    @cta_search = CtaSearch.new
    @cta_assign = CtaAssign.new
    @cta_station = CtaStation.find(params[:id])

    render("cta_stations/show.html.erb")
  end

  def new
    @cta_station = CtaStation.new

    render("cta_stations/new.html.erb")
  end

  def create
    @cta_station = CtaStation.new

    @cta_station.name = params[:name]
    @cta_station.lat = params[:lat]
    @cta_station.lng = params[:lng]
    @cta_station.address = params[:address]

    save_status = @cta_station.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cta_stations/new", "/create_cta_station"
        redirect_to("/cta_stations")
      else
        redirect_back(:fallback_location => "/", :notice => "Cta station created successfully.")
      end
    else
      render("cta_stations/new.html.erb")
    end
  end

  def edit
    @cta_station = CtaStation.find(params[:id])

    render("cta_stations/edit.html.erb")
  end

  def update
    @cta_station = CtaStation.find(params[:id])

    @cta_station.name = params[:name]
    @cta_station.lat = params[:lat]
    @cta_station.lng = params[:lng]
    @cta_station.address = params[:address]

    save_status = @cta_station.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cta_stations/#{@cta_station.id}/edit", "/update_cta_station"
        redirect_to("/cta_stations/#{@cta_station.id}", :notice => "Cta station updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cta station updated successfully.")
      end
    else
      render("cta_stations/edit.html.erb")
    end
  end

  def destroy
    @cta_station = CtaStation.find(params[:id])

    @cta_station.destroy

    if URI(request.referer).path == "/cta_stations/#{@cta_station.id}"
      redirect_to("/", :notice => "Cta station deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cta station deleted.")
    end
  end
end
