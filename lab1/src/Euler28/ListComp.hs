module Euler28.ListComp (spiralSumListComp) where

spiralSumListComp :: Integer -> Integer
spiralSumListComp n = 1 + sum [s * s - m * (s - 1) | k <- [1 .. (n - 1) `div` 2], let s = 2 * k + 1, m <- [0 .. 3]]
