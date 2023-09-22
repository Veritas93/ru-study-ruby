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
        raiting_kinopoisk = array.map { |row| row['rating_kinopoisk'].to_f if selection_conditions?(row) }.compact
        (raiting_kinopoisk.reduce(0) { |sum, number| sum + number }) / raiting_kinopoisk.count
      end

      def chars_count(films, threshold)
        films.reduce(0) do |sum, number|
          sum + (number['rating_kinopoisk'].to_f >= threshold && !number['name'].nil? && number['name'].include?('и') ? number['name'].count('и') : 0)
        end
      end
    end
  end
end
