module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        needed_films = array.map do |film|
          film if countries_count(film) >= 2 && rating_positive?(film)
        end.compact

        overall_rating = needed_films.reduce(0) do |acc, film|
          acc + current_rating(film)
        end

        overall_rating / needed_films.count
      end

      def chars_count(films, threshold)
        films.map { |film| film if current_rating(film) >= threshold }
             .compact
             .reduce(0) { |acc, film| acc + letters_count(film['name'], 'и') }
      end

      private

      def countries_count(film)
        return 0 unless film['country']

        film['country'].split(',').count
      end

      def rating_positive?(film)
        film['rating_kinopoisk'].present? && !film['rating_kinopoisk'].to_f.zero?
      end

      def current_rating(film)
        return 0.0 unless film['rating_kinopoisk']

        film['rating_kinopoisk'].to_f
      end

      def letters_count(string, letter)
        return 0 unless string

        string.count(letter)
      end
    end
  end
end
