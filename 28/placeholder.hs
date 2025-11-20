module Main where

target :: Integer
target = 1001

cornersForLayer :: Integer -> [Integer]
cornersForLayer k = [s * s - m * (s - 1) | m <- [0 .. 3]]
  where
    s = 2 * k + 1

layers :: [[Integer]]
layers = [cornersForLayer k | k <- [1 ..]]

main :: IO ()
main = print $ 1 + sum (concat (take (fromIntegral ((target - 1) `div` 2)) layers))
