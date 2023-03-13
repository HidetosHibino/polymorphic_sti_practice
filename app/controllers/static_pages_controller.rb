class StaticPagesController < ApplicationController
  def top
    Rails.application.eager_load!
    @klasses = ApplicationRecord.descendants
  end
end
