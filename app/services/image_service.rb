# frozen_string_literal: true

module ImagesService
  def add_more_images(new_images)
    images = @post.images
    images += new_images
    @post.images = images
  end

  def remove_image_at_index(index)
    remain_images = @post.images
    deleted_image = remain_images.delete_at(index)
    deleted_image.try(:remove!)
    @post.images = remain_images
  end
end
