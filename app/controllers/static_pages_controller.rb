class StaticPagesController < ApplicationController
  after_action :verify_authorized
  
  def welcome
    authorize :static_page
  end

  def preparer
    authorize :static_page
    if params[:search_inputs].present?
      @search_inputs = OpenStruct.new(params[:search_inputs])
    else
      @search_inputs = OpenStruct.new()
    end

    raw_html = @search_inputs[:text] ? @search_inputs[:text] : ""
    html = raw_html.encode('UTF-8', invalid: :replace, undef: :replace, replace: '', universal_newline: true).gsub(/\P{ASCII}/, '')
    doc = Nokogiri::HTML(html, nil, Encoding::UTF_8.to_s)
    doc = Nokogiri::HTML(@search_inputs[:text])
    doc.xpath('//@style').remove
    doc.xpath('//@script').remove
    body = doc.css('body')    # Or xpath, or whatever method you choose
    body_with_div = "<div class=\"text-justify\" style=\"font-size: large;\">#{body.inner_html}</div>"
    @result = body_with_div

  end

end
