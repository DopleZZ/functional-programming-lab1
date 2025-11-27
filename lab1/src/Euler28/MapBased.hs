module Euler28.MapBased (spiralSumMapBased) where

cornerSeq :: Integer -> [Integer]
cornerSeq n = concatMap corners [1 .. (n - 1) `div` 2]
  where
    corners k =
      let s = 2 * k + 1
       in map (\m -> s * s - m * (s - 1)) [0 .. 3]

spiralSumMapBased :: Integer -> Integer
spiralSumMapBased n = 1 + sum (cornerSeq n)
