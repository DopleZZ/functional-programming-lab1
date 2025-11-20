module Main where

target :: Integer
target = 1001

main :: IO ()
main =
  print $ summi 1

summi :: Integer -> Integer
summi n = n + sum [s * s - m * (s - 1) | k <- [1 .. (target - 1) `div` 2], let s = 2 * k + 1, m <- [0 .. 3]]
