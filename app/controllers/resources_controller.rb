class ResourcesController < ApplicationController
  before_filter :load_resource
  before_filter :load_kart, only: :checkin
  skip_before_filter :verify_authenticity_token, only: :checkin

  def checkin

    unless @resource.nil? or @kard.nil?
      # Save checkin
      @kard.resources << @resource

      # Process achievements
      @resource.achievements.each do |achievement|
        # Trigger Pusher if new Achievement has been unlocked
        if achievement.process_achievement(@kard)
          Pusher.trigger "yak", 'new_achievement', {yak:  @kard.uid, short: @kard.achievements.last.short, title: @kard.achievements.last.title}
        end
      end

      # Send Response to Channel
      Pusher.trigger(@resource.key, 'checkin', {yak_uid: @kard.uid})
      Pusher.trigger('yak', 'checkin', {yak_uid: @kard.uid})

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
