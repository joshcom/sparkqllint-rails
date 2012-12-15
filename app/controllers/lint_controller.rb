class LintController < ApplicationController
  # GET /lints
  # GET /lints.json
  def index
    respond_to do |format|
      @lints = []
      format.html # index.html.erb
      format.json { render json: @lints }
    end
  end

  # GET /lints/1
  # GET /lints/1.json
  def show
    @lint = nil

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lint }
    end
  end
end
