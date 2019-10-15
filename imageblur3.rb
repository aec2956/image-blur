class Image 
  def initialize(image)
    @image = image 
  end

  def find_ones 
    ones = [ ]
    @image.each_with_index do |row, current_pixel_x_position|
      row.each_with_index do |pixel, current_pixel_y_position|
        if pixel == 1 
        ones << [current_pixel_x_position,current_pixel_y_position] 
        end
      end
    end  
    return ones 
  end 

  def blur!(blur_distance)
   ones = find_ones

  @image.each_with_index do |row, current_pixel_x_position|
    row.each_with_index do |pixel, current_pixel_y_position|
      ones.each do |original_one_x_position, original_one_y_position|
        if manhattan_distance(current_pixel_x_position, original_one_x_position, current_pixel_y_position, original_one_y_position) <= blur_distance
        @image[current_pixel_x_position][current_pixel_y_position] = 1
        end
      end
    end
  end
end


  def manhattan_distance (row1, row2, col1, col2)
    diff_row = (row2 - row1).abs
    diff_col = (col2 - col1).abs
    #(row2 - row1).abs + (col2 - col1).abs
    diff_row + diff_col 
  end


  def output_image
    @image.each do |row|
      puts row.join
    end
  end
end  


image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1]
])


image.blur! (2)
image.output_image