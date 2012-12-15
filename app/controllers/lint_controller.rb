require 'filter_validator'

class LintController < ApplicationController
  before_filter :validate_filter

  def index
    respond_to do |format|
      format.html # index.html.erb
      # TODO:  I want to make this a webservice as well.
      # format.json { render json: @filter.to_json }
    end
  end

  def validate_filter
    @filter = FilterValidator.new(params[:_filter])

    unless @filter.blank?

      if @filter.errors?
        @flash_type = "error"
        flash[:error] = @filter.errors.first.message
      else
        @flash_type = "success"
        flash[:notice] = "Looks great!"
      end
    end  
  end
end
