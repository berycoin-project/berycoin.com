module ArticlesHelper
  def category_count(input)
    input.split(',').count
  end
end
