class Upload
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include Mongoid::Paperclip

  has_mongoid_attached_file :attachment

  do_not_validate_attachment_file_type :attachment

  def attachment_url
    attachment.url
  end
end
