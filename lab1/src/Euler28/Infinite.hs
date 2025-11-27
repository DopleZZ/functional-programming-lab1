module Euler28.Infinite (spiralSumInfinite) where

cornersForLayer :: Integer -> [Integer]
cornersForLayer k = [s * s - m * (s - 1) | m <- [0 .. 3]]
  where
    s = 2 * k + 1

layers :: [[Integer]]
layers = [cornersForLayer k | k <- [1 ..]]

spiralSumInfinite :: Integer -> Integer
spiralSumInfinite n = 1 + sum (concat (take layersCount layers))
  where
    layersCount = fromIntegral ((n - 1) `div` 2)
