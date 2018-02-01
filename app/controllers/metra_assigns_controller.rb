class MetraAssignsController < ApplicationController
  def index
    @q = MetraAssign.ransack(params[:q])
    @metra_assigns = @q.result(:distinct => true).includes(:metra_line, :metra_station).page(params[:page]).per(10)

    render("metra_assigns/index.html.erb")
  end

  def show
    @metra_assign = MetraAssign.find(params[:id])

    render("metra_assigns/show.html.erb")
  end

  def new
    @metra_assign = MetraAssign.new

    render("metra_assigns/new.html.erb")
  end

  def create
    @metra_assign = MetraAssign.new

    @metra_assign.metra_line_id = params[:metra_line_id]
    @metra_assign.metra_station_id = params[:metra_station_id]

    save_status = @metra_assign.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/metra_assigns/new", "/create_metra_assign"
        redirect_to("/metra_assigns")
      else
        redirect_back(:fallback_location => "/", :notice => "Metra assign created successfully.")
      end
    else
      render("metra_assigns/new.html.erb")
    end
  end

  def edit
    @metra_assign = MetraAssign.find(params[:id])

    render("metra_assigns/edit.html.erb")
  end

  def update
    @metra_assign = MetraAssign.find(params[:id])

    @metra_assign.metra_line_id = params[:metra_line_id]
    @metra_assign.metra_station_id = params[:metra_station_id]

    save_status = @metra_assign.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/metra_assigns/#{@metra_assign.id}/edit", "/update_metra_assign"
        redirect_to("/metra_assigns/#{@metra_assign.id}", :notice => "Metra assign updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Metra assign updated successfully.")
      end
    else
      render("metra_assigns/edit.html.erb")
    end
  end

  def destroy
    @metra_assign = MetraAssign.find(params[:id])

    @metra_assign.destroy

    if URI(request.referer).path == "/metra_assigns/#{@metra_assign.id}"
      redirect_to("/", :notice => "Metra assign deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Metra assign deleted.")
    end
  end
end
