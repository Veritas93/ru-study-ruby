module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sort = array.map do |n|
          next unless !n['rating_kinopoisk'].nil? && n['rating_kinopoisk'].to_f.positive?

          n['rating_kinopoisk'].to_f if !n['country'].nil? && n['country'].include?(',')
        end
        newsort = sort.compact
        count = newsort.count
        (newsort.reduce(0) { |sum, number| sum + number }) / count
      end

      def chars_count(films, threshold)
        po = []
        sort = films.map do |n|
          next unless !n['rating_kinopoisk'].nil? && (n['rating_kinopoisk'].to_f >= threshold)

          if !n['name'].nil? && n['name'].include?('и')
            st = n['name'].chars
            c = st.map { |n| n == 'и' ? 1 : 0 }
          end
        end
        newsort = sort.compact
        po = newsort.map { |n| n.reduce(0) { |sum, number| sum + number } }

        po.reduce(0) { |sum, number| sum + number }
      end
    end
  end
end
