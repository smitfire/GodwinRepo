module PostHelper
  
  def randoms
    rand_string = ('a'..'z').to_a + (0..9).to_a*3
    rand_string.shuffle[0...6].join
  end

end
