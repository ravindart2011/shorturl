class LinksController < ApplicationController
  
  def index
    @link = Link.new
  end
  
  # Creating an URL into DB and generating short url 
  # returns short url when the given URL already exists in our DB
  def create
    @link = verify_url_and_return 
    
    respond_to do |format|
      if @link.present?
        format.js { render layout: false } 
      else
        @link = Link.new(link_params)
        
        if @link.save
          format.html { redirect_to root_path, success: 'Created Successfully' }
          format.js { render layout: false }
        else
          format.html {redirect_to root_path, alert: 'Something went wrong' }
          format.js { render layout: false }
        end
      end
    end       
  end
  
  def show
    @link = Link.find_by_slug(params[:slug]) 
    render_404 and return if @link.nil? || @link.expired
    save_impression(@link)
    redirect_to @link.url  
  end
  
  def stats
    @stats = Impression.non_expired_links.group_by(&:link)
  end
  
  private
  
  def save_impression(link)
    link.impressions.create({
                        ip_address: request.remote_ip,
                        country: lookup_ip_location.data.dig("country")
                      })
  end
  
  def verify_url_and_return
    url_string = params.dig("link", "url")
    return nil unless url_string

    link = Link.where(url: url_string).first
    link if link
  end
  
  def render_404
    render(file: "#{Rails.root}/public/404")
  end
  
  def link_params
    params.require(:link).permit(:url, :slug)
  end

end
