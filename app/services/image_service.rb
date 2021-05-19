# frozen_string_literal: true

module ImagesService
  def add_more_images(new_images)
    images = @car.images
    images += new_images
    @car.images = images
  end

  def remove_image_at_index(index)
    remain_images = @car.images
    deleted_image = remain_images.delete_at(index)
    deleted_image.try(:remove!)
    @car.images = remain_images
  end
end
