module Stdlib (katsu, katsu3, unkatsu, unkatsu3, munch, munchf) where

-- day1
katsu [x, y] = (x, y)
katsu3 [x, y, z] = (x, y, z)

unkatsu (x, y) = [x, y]
unkatsu3 (x, y, z) = [x, y, z]

munch = map words . lines
munchf f = map (f . words) . lines
