class StaticPagesController < ApplicationController
  def home
    @jobs = Job.selected.ordered.page(params[:page]).per Settings.per_sheet
  end
end
