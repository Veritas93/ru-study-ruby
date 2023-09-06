module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def sort_raiting_and_country(elem)
        true if !elem['rating_kinopoisk'].nil? && elem['rating_kinopoisk'].to_f.positive? && !elem['country'].nil? && elem['country'].split(',').count >= 2
      end

      def rating(array)
        mid_raiting = []
        array.map { |element| mid_raiting << element['rating_kinopoisk'].to_f if sort_raiting_and_country(element) == true }
        (mid_raiting.reduce(0) { |sum, number| sum + number }) / mid_raiting.count
      end

      def chars_count(films, threshold)
        count_letter = 0
        films.map do |element|
          if element['rating_kinopoisk'].to_f >= threshold && !element['name'].nil? && element['name'].include?('и')
            count_letter += element['name'].chars.count('и')
          end
        end
        count_letter
      end
    end
  end
end
