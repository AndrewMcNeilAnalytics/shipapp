test_that(
  "
  get_ships_file_path returns a character object
  "
, {

  file <-
    get_ships_file_path()

  expect_character(
    file
  )

})

test_that(
  "
  get_ships_file_path return value
  is an existing file path
  "
, {

  file <-
    get_ships_file_path()

  file_exists <-
    file.exists(file)

  expect_true(
    file_exists
  )

})

test_that(
  "
  read_ships_data returns a tibble object
  "
, {

  ships_data <-
    read_ships_data()

  expect_tibble(
    ships_data
  )

})

test_that(
  "
  read_ships_data return value passes assertion
  "
, {

  ships_data <-
    read_ships_data()

  expect_true(
    assert_ships_data_raw(
      ships_data
    )
  )

})
