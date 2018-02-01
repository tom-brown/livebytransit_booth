class CtaAssignsController < ApplicationController
  def index
    @q = CtaAssign.ransack(params[:q])
    @cta_assigns = @q.result(:distinct => true).includes(:cta_line, :cta_station).page(params[:page]).per(10)

    render("cta_assigns/index.html.erb")
  end

  def show
    @cta_assign = CtaAssign.find(params[:id])

    render("cta_assigns/show.html.erb")
  end

  def new
    @cta_assign = CtaAssign.new

    render("cta_assigns/new.html.erb")
  end

  def create
    @cta_assign = CtaAssign.new

    @cta_assign.cta_station_id = params[:cta_station_id]
    @cta_assign.cta_line_id = params[:cta_line_id]

    save_status = @cta_assign.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cta_assigns/new", "/create_cta_assign"
        redirect_to("/cta_assigns")
      else
        redirect_back(:fallback_location => "/", :notice => "Cta assign created successfully.")
      end
    else
      render("cta_assigns/new.html.erb")
    end
  end

  def edit
    @cta_assign = CtaAssign.find(params[:id])

    render("cta_assigns/edit.html.erb")
  end

  def update
    @cta_assign = CtaAssign.find(params[:id])

    @cta_assign.cta_station_id = params[:cta_station_id]
    @cta_assign.cta_line_id = params[:cta_line_id]

    save_status = @cta_assign.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cta_assigns/#{@cta_assign.id}/edit", "/update_cta_assign"
        redirect_to("/cta_assigns/#{@cta_assign.id}", :notice => "Cta assign updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cta assign updated successfully.")
      end
    else
      render("cta_assigns/edit.html.erb")
    end
  end

  def destroy
    @cta_assign = CtaAssign.find(params[:id])

    @cta_assign.destroy

    if URI(request.referer).path == "/cta_assigns/#{@cta_assign.id}"
      redirect_to("/", :notice => "Cta assign deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cta assign deleted.")
    end
  end
end
