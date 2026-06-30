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

  # Render a hash as a JSON-LD <script> tag. json_escape neutralises </script>
  # and other HTML-significant characters so the payload can't break out.
  def json_ld_tag(data)
    content_tag(:script, ERB::Util.json_escape(data.to_json).html_safe, type: "application/ld+json")
  end

  # Site-wide Organization + WebSite structured data (rendered in <head>).
  def site_structured_data_tags
    base = request.base_url
    organization = {
      "@context" => "https://schema.org",
      "@type" => "Organization",
      "name" => "全民司法改革運動",
      "url" => base,
      "logo" => "#{base}/images/logo.png"
    }
    website = {
      "@context" => "https://schema.org",
      "@type" => "WebSite",
      "name" => "全民司法改革運動",
      "url" => base
    }
    safe_join([json_ld_tag(organization), json_ld_tag(website)])
  end

  # Article structured data for content pages (analyses / solutions).
  def article_structured_data(record, image_url = nil)
    data = {
      "@context" => "https://schema.org",
      "@type" => "Article",
      "headline" => record.title,
      "datePublished" => record.created_at.iso8601,
      "dateModified" => record.updated_at.iso8601,
      "author" => { "@type" => "Organization", "name" => "全民司法改革運動" },
      "publisher" => {
        "@type" => "Organization",
        "name" => "全民司法改革運動",
        "logo" => { "@type" => "ImageObject", "url" => "#{request.base_url}/images/logo.png" }
      },
      "mainEntityOfPage" => request.url
    }
    data["image"] = image_url if image_url.present?
    json_ld_tag(data)
  end

  def display_shorter(str, length, additional = "⋯⋯")
    length = length * 2
    text = Nokogiri::HTML(str).text
    if Unicode::DisplayWidth.of(text) >= length
      additional_text = Nokogiri::HTML(additional).text
      new_length = length - Unicode::DisplayWidth.of(additional_text)
      short_string = text[0..new_length]
      while Unicode::DisplayWidth.of(short_string) > new_length
        short_string = short_string[0..-2]
      end
      short_string + additional
    else
      text
    end
  end
end
