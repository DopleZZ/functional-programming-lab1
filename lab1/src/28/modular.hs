module Main where

target :: Integer
target = 1001

cornersForLayer :: Integer -> [Integer]
cornersForLayer k = [s * s - m * (s - 1) | m <- [0 .. 3]]
  where
    s = 2 * k + 1

layers :: Integer -> [[Integer]]
layers n = [cornersForLayer k | k <- [1 .. (n - 1) `div` 2]]

main :: IO ()
main = print $ 1 + sum (map sum (layers target))
