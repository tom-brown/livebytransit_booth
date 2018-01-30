class MetraLinesController < ApplicationController
  def index
    @q = MetraLine.ransack(params[:q])
    @metra_lines = @q.result(:distinct => true).includes(:metra_assigns, :metra_stations).page(params[:page]).per(10)

    render("metra_lines/index.html.erb")
  end

  def show
    @metra_assign = MetraAssign.new
    @metra_line = MetraLine.find(params[:id])

    render("metra_lines/show.html.erb")
  end

  def new
    @metra_line = MetraLine.new

    render("metra_lines/new.html.erb")
  end

  def create
    @metra_line = MetraLine.new


    save_status = @metra_line.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/metra_lines/new", "/create_metra_line"
        redirect_to("/metra_lines")
      else
        redirect_back(:fallback_location => "/", :notice => "Metra line created successfully.")
      end
    else
      render("metra_lines/new.html.erb")
    end
  end

  def edit
    @metra_line = MetraLine.find(params[:id])

    render("metra_lines/edit.html.erb")
  end

  def update
    @metra_line = MetraLine.find(params[:id])


    save_status = @metra_line.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/metra_lines/#{@metra_line.id}/edit", "/update_metra_line"
        redirect_to("/metra_lines/#{@metra_line.id}", :notice => "Metra line updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Metra line updated successfully.")
      end
    else
      render("metra_lines/edit.html.erb")
    end
  end

  def destroy
    @metra_line = MetraLine.find(params[:id])

    @metra_line.destroy

    if URI(request.referer).path == "/metra_lines/#{@metra_line.id}"
      redirect_to("/", :notice => "Metra line deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Metra line deleted.")
    end
  end
end
