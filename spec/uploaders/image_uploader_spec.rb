require "rails_helper"
require "tempfile"

describe ImageUploader do
  let(:uploader) { ImageUploader.new(Analysis.new, :image) }

  def upload(path, content_type)
    Rack::Test::UploadedFile.new(path, content_type)
  end

  it "accepts a real image" do
    file = upload(Rails.root.join("spec", "fixtures", "test.jpg"), "image/jpeg")
    expect { uploader.cache!(file) }.not_to raise_error
  end

  it "rejects a non-image disguised with an image extension" do
    evil = Tempfile.new(["evil", ".jpg"])
    evil.write("<script>alert(1)</script>")
    evil.rewind
    begin
      expect { uploader.cache!(upload(evil.path, "text/html")) }
        .to raise_error(CarrierWave::IntegrityError)
    ensure
      evil.close!
    end
  end

  it "rejects a disallowed extension" do
    bad = Tempfile.new(["payload", ".exe"])
    bad.write("data")
    bad.rewind
    begin
      expect { uploader.cache!(upload(bad.path, "application/octet-stream")) }
        .to raise_error(CarrierWave::IntegrityError)
    ensure
      bad.close!
    end
  end
end
