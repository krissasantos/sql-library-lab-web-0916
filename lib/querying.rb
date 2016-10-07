def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books
  WHERE books.series_id = 1
  ORDER BY books.year ASC"

end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto 
  FROM characters
  ORDER BY LENGTH(motto) DESC LIMIT 1"
end

def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species)
  FROM characters 
  GROUP BY characters.species
  ORDER BY COUNT(characters.species) DESC LIMIT 1 "
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name 
  FROM authors 
  JOIN series
  ON authors.id = series.author_id
  JOIN subgenres
  on series.subgenre_id = subgenres.id"
end

def select_series_title_with_most_human_characters
  "SELECT series.title 
  FROM series 
  JOIN characters
  ON series.id = characters.series_id
  GROUP BY series.title HAVING characters.species = 'human'
  ORDER BY COUNT(characters.species) DESC LIMIT 1 "
 
end

def select_character_names_and_number_of_books_they_are_in
  #  "SELECT characters.name, COUNT(books.title) 
  # FROM characters
  # JOIN character_books
  # ON character_books.character_id = characters.id
  # JOIN books
  # ON character_books.book_id = books.id
  # "
  "SELECT characters.name, COUNT(character_books.book_id) 
  FROM characters
  JOIN character_books
  ON character_books.character_id = characters.id
  GROUP BY characters.name 
  ORDER BY COUNT(character_books.book_id) DESC
  "
  # "SELECT characters.name, COUNT(books.title) 
  # FROM characters
  # JOIN books
  # ON characters.book_id = books.id
  # JOIN character_books
  # ON character_books.character_id = characters.id
  # "

  #   "SELECT characters.name, COUNT(books.title) 
  # FROM characters
  # JOIN books
  # ON characters.book_id = books.id
  # JOIN character_books
  # character_books.character_id = characters.id
  # ON character_books.book_id = books.id"
end
