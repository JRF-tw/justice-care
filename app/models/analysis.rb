class Analysis < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :problems, -> { uniq }
  has_many :reports
  paginates_per 15
  default_scope { order(no: :asc).order(id: :asc) }

  before_save :update_youtube_values

  def update_youtube_values
    if self.youtube_url.blank?
      self.youtube_id = nil
      return true
    end
    youtube_id = extract_youtube_id(self.youtube_url)
    unless youtube_id
      self.youtube_url = nil
      self.youtube_id = nil
      errors.add(:base, 'youtube網址錯誤')
      return false
    end
    if self.youtube_id == youtube_id
      # means that youtube is the same, no need to update.
      return nil
    end
    self.youtube_id = youtube_id
    self.youtube_url = "https://www.youtube.com/watch?v=" + self.youtube_id
  end

  private

  def extract_youtube_id(url)
    youtube_uri = URI.parse(url)
    if youtube_uri.host == 'www.youtube.com'
      params = youtube_uri.query
      if params
        youtube_id = CGI::parse(params)['v'].first
      else
        youtube_id = youtube_uri.path.split('/')[-1]
      end
    elsif youtube_uri.host == 'youtu.be'
      youtube_id = youtube_uri.path[1..-1]
    else
      self.youtube_url = nil
      errors.add(:base, 'youtube網址錯誤')
      return false
    end
  end
end
