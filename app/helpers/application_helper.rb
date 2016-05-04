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
      og: {
        title: '全民司法改革運動',
        description: '',
        type: 'website',
        image: "#{Setting.url.protocol}://#{Setting.url.host}/images/fb.png",
        site_name: '全民司法改革運動'
      },
      twitter: {
        card: 'summary_large_image',
        image: "#{Setting.url.protocol}://#{Setting.url.host}/images/fb.png"
      }
    }
  end
end
