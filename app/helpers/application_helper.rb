module ApplicationHelper
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def default_meta_tags
    {
      separator: "—",
      site: '全民司法改革運動',
      reverse: true,
      description: '',
      canonical: request.url,
      publisher: Setting.google.pages,
      author: Setting.google.pages,
      og: {
        title: '全民司法改革運動',
        description: '',
        type: 'website',
        image: "#{Setting.url.protocol}://#{Setting.url.host}/images/fb.png",
        site_name: '全民司法改革運動',
        url: request.url
      },
      twitter: {
        card: 'summary_large_image',
        image: "#{Setting.url.protocol}://#{Setting.url.host}/images/fb.png"
      },
      fb: {
        pages: Setting.fb.pages
      }
    }
  end

  def display_shorter(str, length, additional = "⋯⋯")
    length = length * 2
    text = Nokogiri::HTML(str).text
    if text.display_width >= length
      additional_text = Nokogiri::HTML(additional).text
      new_length = length - additional_text.display_width
      short_string = text[0..new_length]
      while short_string.display_width > new_length
        short_string = short_string[0..-2]
      end
      short_string + additional
    else
      text
    end
  end
end
