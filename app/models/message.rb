class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include Mongoid::Paperclip

  field :chatroom_id, type: Integer
  field :user_id, type: Integer
  field :content, type: String
  field :direct_message, type: Boolean, default: false

  belongs_to :chatroom
  belongs_to :user

  # embeds_many :pictures, :cascade_callbacks => true
  # has_mongoid_attached_file :picture,
  #   :path => ":rails_root/public/pictures/:id/:filename",
  #   :url  => "/pictures/:id/:filename",
  #   :styles => {
  #     :original => ['1920x1680>', :jpg],
  #     :small    => ['100x100#',   :jpg],
  #     :medium   => ['250x250',    :jpg],
  #     :large    => ['500x500>',   :jpg]
  #   },
  #   :convert_options => { :all => '-background white -flatten +matte' }

  # validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  after_save do
    p '=============='
    p '=============='
    p '=============='
    # BroadcastMessageJob.perform_now self
  end

  # has_attached_file :image, styles: { medium: "300x300>", thumb: "120x120>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  # after_create_commit { BroadcastMessageJob.perform_later self  }

  def to_jq_upload
    {
       "name" => read_attribute(:picture_file_name),
      "size" => read_attribute(:picture_file_size),
      "url" => picture.url(:original),

   }
  end

end
