module Tsuno
  # Converts grades onto the 4.0 GPA scale.
  # @!attribute [r] result
  #   @retun [Float] The average of every course on the 4.0 scale
  class GPA
    attr_reader(:result)

    # Initializes GPA
    # @param [Array] courses an array of courses
    def initialize(courses)
      @result = courses.map(&:as_4_scale).reduce(:+) / courses.length
      @result = @result.round(2)
    end
  end
end

