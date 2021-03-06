module Tsuno
  # Represents a specific weighted activity within a course.
  # @!attribute [r] grade
  #   @return [Float] The final grade
  # @!attribute [r] weight
  #   @return [String] The weight of the activity. Ex. 0.4
  # @!attribute [r] name
  #   @return [String] The activity name. Ex. Final Exam
  class Activity
    attr_reader(:grade, :weight, :name)

    # Initializes Activity
    #
    #   Activity.new(YAML.parse('test: ing'))
    # @param [YAML::DBM] data an activity in YAML format
    def initialize(data)
      @grade = data['grade'] || complex_grade(data['sections'])
      @weight = data['weight']
      @name = data['name']
    end

    # Calculates the final grade from each section.
    #
    #   complex_grade(YAML.parse('test: ing'))
    # @param [YAML::DBM] sections each section in YAML format
    # @return [Float] the calculated grade
    def complex_grade(sections)
      if sections[0]['weight']
        sections.map {|section|
          section['grade'] * section['weight']
        }.reduce(:+)
      else
        grades = sections.map {|section| section['grade']}
        grades.reduce(:+) / grades.size
      end
    end
  end
end

