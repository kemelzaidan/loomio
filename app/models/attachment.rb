class Attachment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment, counter_cache: true

  has_attached_file :file
  do_not_validate_attachment_file_type :file

  validates :user_id, presence: true

  alias_method :author, :user
  alias_method :author=, :user=
  #alias_method :author_id, :user_id
  #alias_method :author_id=, :user_id=

  def is_an_image?
    %w[jpg jpeg png gif].include?(filetype)
  end

  def truncated_filename(length = 30)
    if filename.length > length
      filename.truncate(length) + filetype
    else
      filename
    end
  end

  def filetype
    (file_content_type.try(:split, '/') || filename.try(:split, '.')).last.downcase
  end

  def location
    super || file.url
  end

  def filesize
    super || file_file_size
  end

end
