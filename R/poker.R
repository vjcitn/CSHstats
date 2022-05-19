#' test for one pair
#' @param x a vector of cards
#' @return logical(1)
#' @examples
#' d = build_deck()
#' hand_1 = c(d[1], d[14], d[2:4] )
#' hand_1
#' one_pair(hand[1])
#' hand_2 = c(d[1], d[6], d[2:4] )
#' hand_2
#' one_pair(hand[2])
#' @export
one_pair = function(x){tx = table(faces(x)); max(tx)==2 && sum(tx==2)==1}

#' test for full house
#' @param x a vector of cards
#' @examples
#' d = build_deck()
#' h1 = c(d[1], d[14], d[27], d[2], d[15])
#' h1
#' full_house(h1)
#' h2 = c(d[1], d[14], d[27], d[2], d[16])
#' h2
#' full_house(h2)
#' @export
full_house = function(x) all(table(faces(x)) %in% c(2,3))

#' test for two pairs
#' @param x a vector of cards
#' @examples
#' d = build_deck()
#' h1 = c(d[1], d[14], d[27], d[2], d[15])
#' h1
#' two_pairs(h1)
#' @export
two_pairs = function(x)sum(table(faces(x))==2)==2

#' test for flush
#' @param x a vector of cards
#' @examples
#' d = build_deck()
#' h1 = c(d[1:4], d[6])
#' h1
#' is_flush(h1)
#' @export
is_flush = function(x) all(suits(x)==suits(x)[1])

