module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def selection_conditions?(row)
        !row['rating_kinopoisk'].nil? && row['rating_kinopoisk'].to_f.positive? && !row['country'].nil? && row['country'].split(',').count >= 2
      end

      def rating(array)
        raiting_kinopoisk = []
        array.map { |row| raiting_kinopoisk << row['rating_kinopoisk'].to_f if selection_conditions?(row) }
        (raiting_kinopoisk.reduce(0) { |sum, number| sum + number }) / raiting_kinopoisk.count
      end

      def chars_count(films, threshold)
        array_count_letters_i = films.each_with_object([]) do |value, array|
          array << value['name'].count('и') if value['rating_kinopoisk'].to_f >= threshold && !value['name'].nil? && value['name'].include?('и')
        end
        array_count_letters_i.reduce(0) { |sum, number| sum + number }
      end
    end
  end
end
