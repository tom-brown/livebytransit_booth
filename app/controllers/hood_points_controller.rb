class HoodPointsController < ApplicationController
  def index
    @q = HoodPoint.ransack(params[:q])
    @hood_points = @q.result(:distinct => true).includes(:neighborhood).page(params[:page]).per(10)

    render("hood_points/index.html.erb")
  end

  def show
    @hood_point = HoodPoint.find(params[:id])

    render("hood_points/show.html.erb")
  end

  def new
    @hood_point = HoodPoint.new

    render("hood_points/new.html.erb")
  end

  def create
    @hood_point = HoodPoint.new

    @hood_point.neighborhood_id = params[:neighborhood_id]
    @hood_point.lat = params[:lat]
    @hood_point.lng = params[:lng]

    save_status = @hood_point.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hood_points/new", "/create_hood_point"
        redirect_to("/hood_points")
      else
        redirect_back(:fallback_location => "/", :notice => "Hood point created successfully.")
      end
    else
      render("hood_points/new.html.erb")
    end
  end

  def edit
    @hood_point = HoodPoint.find(params[:id])

    render("hood_points/edit.html.erb")
  end

  def update
    @hood_point = HoodPoint.find(params[:id])

    @hood_point.neighborhood_id = params[:neighborhood_id]
    @hood_point.lat = params[:lat]
    @hood_point.lng = params[:lng]

    save_status = @hood_point.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hood_points/#{@hood_point.id}/edit", "/update_hood_point"
        redirect_to("/hood_points/#{@hood_point.id}", :notice => "Hood point updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Hood point updated successfully.")
      end
    else
      render("hood_points/edit.html.erb")
    end
  end

  def destroy
    @hood_point = HoodPoint.find(params[:id])

    @hood_point.destroy

    if URI(request.referer).path == "/hood_points/#{@hood_point.id}"
      redirect_to("/", :notice => "Hood point deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Hood point deleted.")
    end
  end
end
