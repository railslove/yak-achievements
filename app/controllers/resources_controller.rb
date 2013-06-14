class ResourcesController < ApplicationController
  before_filter :load_resource
  before_filter :load_kart, only: :checkin
  skip_before_filter :verify_authenticity_token, only: :checkin

  def checkin

    unless @resource.nil? or @kard.nil?
      # Save checkin
      @kard.resources << @resource
      # Push a notification (example)
      # Pusher['yak'].trigger('new_checkin', {:message => 'BlaBlubBla'})
      send_response(checkins: @kard.resources.where(id: @resource.id).count)
    else
      errors = {}

      errors[:resource] = "Resource missing." if @resource.nil? and params[:resource].nil?
      errors[:resource] = "Resource not found." if @resource.nil? and params[:resource].present?
      errors[:kard_uid] = "YAK-UID missing."  if @kard.nil?

      send_response({errors: errors})
    end
  end

  protected

  def load_resource
    @resource = Resource.find_by_key params[:resource]
  end

  def load_kart
    @kard = YetAnotherKard.find_or_create_by_uid params[:yak_uid] unless params[:yak_uid].nil?

    Rails.logger.debug @kard.inspect
  end

  def send_response(response)
    respond_to do |format|
      format.json do
        render :json => {success: (response[:errors].blank? ? true : false)}.merge(response).to_json
      end
      format.xml do
        render :xml => {success: (response[:errors].blank? ? true : false)}.merge(response).to_xml
      end
      format.html {render :file => 'public/404.html', :status => :not_found, :layout => false}
    end
  end
end
