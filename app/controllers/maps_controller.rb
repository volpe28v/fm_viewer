class MapsController < ApplicationController
  def index
    @mm_files = get_mm_files
    @current_mm_file = @mm_files.first
  end

  def change
    @mm_files = get_mm_files
    @current_mm_file = params[:mm_file]
    render :action => :index

  end

  private

  def get_mm_files
    mm_path = Rails.root + "public/maps/"
    mm_files = []
    Dir::glob(Rails.root + "public/maps/**/*.mm").each {|f|
      mm_files << f.gsub(/#{mm_path}/,"")
    }

    return mm_files
  end

end
