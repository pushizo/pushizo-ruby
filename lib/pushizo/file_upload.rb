# frozen_string_literal: true

module Pushizo
  # Multipart dosya alanı. İçerik bellekte tutulur ki yeniden denemeler aynı gövdeyi göndersin.
  class FileUpload
    attr_reader :filename, :content, :content_type

    def initialize(content, filename: "upload", content_type: nil)
      @content = content.to_s.b
      @filename = filename.to_s.empty? ? "upload" : filename.to_s
      @content_type = content_type || (@filename.end_with?(".csv") ? "text/csv" : "application/octet-stream")
    end

    # Diskteki dosyayı okur.
    def self.from_path(path, content_type: nil)
      new(File.binread(path), filename: File.basename(path), content_type: content_type)
    end

    # FileUpload, IO (ör. File.open(path, "rb")) veya String içeriği FileUpload'a çevirir.
    def self.wrap(value)
      case value
      when FileUpload then value
      when String then new(value)
      else
        name = value.respond_to?(:path) && value.path ? File.basename(value.path) : "upload"
        new(value.read, filename: name)
      end
    end
  end
end
