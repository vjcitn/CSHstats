#' make a deck of cards with 52 elements and unicode symbols for suits
#' @export
build_deck = function() {
 faces = c(2:10, "J", "Q", "K", "A")
 suits = c("\U2661", "\U2662", "\U2663", "\U2664")
 hearts = paste(faces, suits[1])
 diamonds = paste(faces, suits[2])
 clubs = paste(faces, suits[3])
 spades = paste(faces, suits[4])
 c(hearts, diamonds, clubs, spades)
}

#' get suits of a collection of cards
#' @param x a card from a deck made by `build_deck`
#' @examples
#' d = build_deck()
#' d[1]
#' suits(d[1:2])
#' @export
suits = function(x) sapply(strsplit(x, " "), "[", 2)

#' get faces of a collection of cards
#' @param x a card from a deck made by `build_deck`
#' @examples
#' d = build_deck()
#' d[1]
#' faces(d[1:2])
#' @export
faces = function(x)  sapply(strsplit(x, " "), "[", 1)
