class ShowingsController < ApplicationController
  def index
    @q = Showing.ransack(params[:q])
    @showings = @q.result(:distinct => true).includes(:listing, :user).page(params[:page]).per(10)

    render("showings/index.html.erb")
  end

  def show
    @showing = Showing.find(params[:id])

    render("showings/show.html.erb")
  end

  def new
    @showing = Showing.new

    render("showings/new.html.erb")
  end

  def create
    @showing = Showing.new

    @showing.user_id = params[:user_id]
    @showing.listing_id = params[:listing_id]
    @showing.message = params[:message]
    @showing.date = params[:date]

    save_status = @showing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/showings/new", "/create_showing"
        redirect_to("/showings")
      else
        redirect_back(:fallback_location => "/", :notice => "Showing created successfully.")
      end
    else
      render("showings/new.html.erb")
    end
  end

  def edit
    @showing = Showing.find(params[:id])

    render("showings/edit.html.erb")
  end

  def update
    @showing = Showing.find(params[:id])

    @showing.user_id = params[:user_id]
    @showing.listing_id = params[:listing_id]
    @showing.message = params[:message]
    @showing.date = params[:date]

    save_status = @showing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/showings/#{@showing.id}/edit", "/update_showing"
        redirect_to("/showings/#{@showing.id}", :notice => "Showing updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Showing updated successfully.")
      end
    else
      render("showings/edit.html.erb")
    end
  end

  def destroy
    @showing = Showing.find(params[:id])

    @showing.destroy

    if URI(request.referer).path == "/showings/#{@showing.id}"
      redirect_to("/", :notice => "Showing deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Showing deleted.")
    end
  end
end
