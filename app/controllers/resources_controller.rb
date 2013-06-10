class ResourcesController < ApplicationController
  before_filter :load_resource
  before_filter :load_kart, only: :checkin

  def checkin
    # Save checkin
    @kard.resources << @resource
  end

  protected

  def load_resource
    @resource = Resource.find_by_key params[:resource]

    Rails.logger.debug @resource.inspect
    render :file => 'public/404', format: [:html], :status => :not_found, :layout => false if @resource.nil?
  end

  def load_kart
    @kard = YetAnotherKard.find_or_create_by_uid params[:kard_uid]
    Rails.logger.debug @kard.inspect
    render :file => 'public/404', format: [:html], :status => :not_found, :layout => false if @kard.nil?
  end
end
