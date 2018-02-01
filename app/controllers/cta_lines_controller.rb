class CtaLinesController < ApplicationController
  def index
    @q = CtaLine.ransack(params[:q])
    @cta_lines = @q.result(:distinct => true).includes(:cta_assigns, :cta_stations).page(params[:page]).per(10)

    render("cta_lines/index.html.erb")
  end

  def show
    @cta_assign = CtaAssign.new
    @cta_line = CtaLine.find(params[:id])

    render("cta_lines/show.html.erb")
  end

  def new
    @cta_line = CtaLine.new

    render("cta_lines/new.html.erb")
  end

  def create
    @cta_line = CtaLine.new

    @cta_line.name = params[:name]

    save_status = @cta_line.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cta_lines/new", "/create_cta_line"
        redirect_to("/cta_lines")
      else
        redirect_back(:fallback_location => "/", :notice => "Cta line created successfully.")
      end
    else
      render("cta_lines/new.html.erb")
    end
  end

  def edit
    @cta_line = CtaLine.find(params[:id])

    render("cta_lines/edit.html.erb")
  end

  def update
    @cta_line = CtaLine.find(params[:id])

    @cta_line.name = params[:name]

    save_status = @cta_line.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cta_lines/#{@cta_line.id}/edit", "/update_cta_line"
        redirect_to("/cta_lines/#{@cta_line.id}", :notice => "Cta line updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cta line updated successfully.")
      end
    else
      render("cta_lines/edit.html.erb")
    end
  end

  def destroy
    @cta_line = CtaLine.find(params[:id])

    @cta_line.destroy

    if URI(request.referer).path == "/cta_lines/#{@cta_line.id}"
      redirect_to("/", :notice => "Cta line deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cta line deleted.")
    end
  end
end
