require 'tsuno/activity'

module Tsuno
  # Represents an individual course taken within a semester.
  # @!attribute [r] grade
  #   @return [Float] The final grade
  # @!attribute [r] name
  #   @return [String] The course name. Ex. Calculus I
  class Course
    attr_reader(:grade, :name);

    # Initializes Course
    #
    #   Tsuno.new([YAML.parse('test: ing')])
    def initialize(data)
      @activities = []
      data['activities'].each do |activity_as_yml|
        @activities << Activity.new(activity_as_yml)
      end

      @name = data['name']
      @grade = calc_final_grade
    end

    # Calculates the final grade from each weighed course
    # @return [Float] The final grade
    def calc_final_grade
      @activities.map {|activity| activity.weight * activity.grade}.reduce(:+)
    end

    # Converts grade to the 4.0 scale
    # @return [Float] The grade in 4.0 form
    def as_4_scale
      case grade.round(2)
      when 0.90..1.00
        4.0
      when 0.85..0.89
        3.8
      when 0.80..0.84
        3.6
      when 0.77..0.79
        3.3
      end
    end
  end
end

