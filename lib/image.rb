class Image
  attr_accessor :image, :row, :ones, :transform

  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |row|
      puts row.join("")
    end
  end

  def blur(distance)
    ones = []
    distance.times do
      @image.each_with_index do |row, row_index|
        row.each_with_index do |pixel, pixel_index|
          if pixel == 1
            ones << [row_index, pixel_index] 
          end
        end
      end

        ones.each do |row_index, pixel_index, distance|
          @image[row_index][pixel_index + 1] = 1 unless @image[pixel_index].last == 1
          @image[row_index][pixel_index - 1] = 1 unless @image[pixel_index].first == 1
          @image[row_index + 1][pixel_index] = 1 unless @image[row_index] == @image[-1]
          @image[row_index - 1][pixel_index] = 1 unless @image[row_index] == @image[0]
        end
      end
    output_image
  end 
end
