require 'coderay'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  def sourcecode
    html = CodeRay.scan(code, :ruby).div(line_numbers: :table)
    render :text => "<pre>#{html}</pre>"
  end

  private

  def source_filename
    "/#{params[:path]}.#{params[:format]}"
  end

  def code
    File.read source_filename
  end
end
