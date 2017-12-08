class Picture
  include Mongoid::Document
  include Mongoid::Paperclip
  embedded_in :message, :inverse_of => :pictures

  has_mongoid_attached_file :picture,
    :path => ":rails_root/public/pictures/:id/:filename",
    :url  => "/pictures/:id/:filename",
    :styles => {
      :original => ['1920x1680>', :jpg],
      :small    => ['100x100#',   :jpg],
      :medium   => ['250x250',    :jpg],
      :large    => ['500x500>',   :jpg]
    },
    :convert_options => { :all => '-background white -flatten +matte' }
end

