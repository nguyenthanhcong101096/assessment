class ShareVideoService
  require 'open-uri'

  REGEX_YOUTUBE_LINK  = %r{\A(https://www\.|https://)youtube.com(/[A-z0-9].*)\z}.freeze

  def self.call(current_user, url)
    new(current_user, url).create_share_video
  end

  def initialize(current_user, url)
    @current_user = current_user
    @url          = url
  end

  def create_share_video
    video = current_user.videos.new(video_params)

    return false unless video.valid?

    video.save!
    video
  rescue StandardError
    false
  end

  private

  attr_reader :current_user, :url

  def video_params
    {
      video_title:       document.css('title').children.text,
      video_description: document.css('title').children.text,
      video_id:          video_id,
      video_url:         video_url
    }
  end

  def document
    @document ||= Nokogiri::HTML.parse(open(video_url), nil, Encoding::UTF_8.to_s)
  end

  def video_url
    raise 'invalid link' unless REGEX_YOUTUBE_LINK.match?(url)
  
    url
  end

  def video_id
    video_url.split("?v=").last.split('&').first
  end
end