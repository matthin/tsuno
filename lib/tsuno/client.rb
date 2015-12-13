require 'tsuno/course'
require 'tsuno/gpa'
require 'yaml'

module Tsuno
  class Client
    # Initializes Client
    #
    #   Tsuno.new([some_file.yml])
    # @param [Array] files an array of each course's YAML file
    def initialize(files)
      courses = files.map {|file| Course.new(YAML.load(file))}
      longest = courses.map {|course| course.name.length}.max
      courses.each do |course|
        grade = (course.grade * 100)
        printf("%-#{longest}s - %.2f%%\n", course.name, grade)
      end

      puts 'Your current GPA is: ' + GPA.new(courses).result.to_s
    end
  end
end

