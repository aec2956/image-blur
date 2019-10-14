class Image 
  def initialize(my_array)
    @array = my_array 
  end

  def output_image
    @array.each do |subarray|
      puts subarray.join
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image