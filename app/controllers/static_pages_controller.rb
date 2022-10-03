class StaticPagesController < ApplicationController
  after_action :verify_authorized

  def welcome
    authorize :static_page

    @page_title = "Was ist Ethik?"
    @page_description = "Was ist Ethik? Finde es heraus in diesem interaktiven Lernkurs!"

    course_ids = Rails.cache.fetch("welcome_course_ids", expires_in: 24.hours) do
      Course.where(group: "ethik").order(:sort).pluck(:id)
    end
    @ethic_courses = Course.where(id: course_ids)

    #@ethic_courses = Course.where(group: "ethik").order(:sort)
    render layout: "application_welcome"
  end

  def test_seite
    authorize :static_page
    render layout: "application_test"
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
