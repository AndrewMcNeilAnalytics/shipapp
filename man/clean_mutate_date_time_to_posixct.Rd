% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean_ships_data.R
\name{clean_mutate_date_time_to_posixct}
\alias{clean_mutate_date_time_to_posixct}
\title{Convert date_time column from character to POSIXct}
\usage{
clean_mutate_date_time_to_posixct(.ships_data)
}
\arguments{
\item{.ships_data}{(tbl_df) Ships data}
}
\value{
(tbl_df) Ships data with POSIXct date_time
}
\description{
Convert date_time column from character to POSIXct
}
