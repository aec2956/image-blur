class Image 
  def initialize(image)
    @image = image 
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur! 
   ones = find_ones
   @image.each_with_index do |row, current_pixel_x_position|
    row.each_with_index do |pixel, current_pixel_y_position|
      ones.each do |original_one_x_position, original_one_y_position|
        if (calc_distance(current_pixel_x_position, original_one_x_position, current_pixel_y_position, original_one_y_position) == 1)
        @image[current_pixel_x_position][current_pixel_y_position] = 1
        end
      end
    end
   end 
 end   
  def find_ones 
    ones = [ ]
    @image.each_with_index do |row, x|
      row.each_with_index do |pixel, y|
        ones << [x,y] if pixel == 1 
        end
      end 


    return ones 
  end 

  def calc_distance(row1, row2, col1, col2)
    diff_row = (row1 -row2).abs
    diff_col = (col1 - col2).abs
    return diff_row + diff_col 
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.blur!
image.output_image