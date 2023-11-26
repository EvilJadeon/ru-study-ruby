module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        prepared_films = map(array) do |film|
          film if countries_count(film) >= 2 && rating_positive?(film)
        end

        needed_films = compact(prepared_films)

        overall_rating = reduce(needed_films, 0) do |acc, film|
          acc + current_rating(film)
        end

        overall_rating / needed_films.count
      end

      def chars_count(films, threshold)
        sort_films = map(films) { |film| film if current_rating(film) >= threshold }
        compact_films = compact(sort_films)
        reduce(compact_films, 0) { |acc, film| acc + letters_count(film['name'], 'и') }
      end

      private

      def map(array)
        new_collection = []
        for i in array
          new_collection << yield(i)
        end
        new_collection
      end

      def reduce(array, acc_init = nil)
        acc = acc_init
        for i in array
          acc = acc.nil? ? i : yield(acc, i)
        end
        acc
      end

      def compact(array)
        new_collection = []
        for i in array
          new_collection << i unless i.nil?
        end
        new_collection
      end

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
