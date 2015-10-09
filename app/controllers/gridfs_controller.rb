class GridfsController < ApplicationController
  def logo
    logo = Category.find(params[:id]).logo
    begin
      self.response_body = logo.read
      self.content_type = logo.content_type
    rescue
      self.status = :file_not_found
      self.content_type = 'text/plain'
      self.response_body = ''
    end
  end
end
