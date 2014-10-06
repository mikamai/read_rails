require 'coderay'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    render :text => %{<pre>#{caller_to_links}</pre>}
  end

  def sourcecode
    html = CodeRay.scan(code, :ruby).div(line_numbers: :table)
    render :text => "<pre>#{html}</pre>"
  end

  private

  def caller_to_links
    caller.map do |line|
      %{<a href="#{line}">#{line}</a>}
    end.join "\n"
  end

  def source_filename
    basename = params[:path].split(':')[0]
    "/#{basename}.rb"
  end

  def code
    File.read source_filename
  end
end
