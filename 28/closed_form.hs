module Main where

-- Closed-form formula for spiral sum: for size n (odd)
-- sum = (4n^2 - 6(n-1)) + ... + 1
-- A known formula: S(n) = (16/3)k^3 + 10k^2 + (26/3)k + 1, where n = 2k+1

target :: Integer
target = 1001

spiralSumClosed :: Integer -> Integer
spiralSumClosed n = ((16*k^3 + 30*k^2 + 26*k) `div` 3) + 1
  where
    k = (n - 1) `div` 2

main :: IO ()
main = print (spiralSumClosed target)
