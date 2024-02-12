class ScansController < ApplicationController
  before_action :authenticate_user!

  def scan
    scan_result = Services::ScanService.new.call(params[:target]) if params[:target].present?
    if scan_result
      respond_to do |format|
        format.turbo_stream {  }
        format.json { render json: scan_result, status: 200 }
      end
    end
  end
end
