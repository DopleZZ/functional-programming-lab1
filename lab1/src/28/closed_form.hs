module Main where

target :: Integer
target = 1001

spiralSumClosed :: Integer -> Integer
spiralSumClosed n = ((16 * k ^ 3 + 30 * k ^ 2 + 26 * k) `div` 3) + 1
  where
    k = (n - 1) `div` 2

main :: IO ()
main = print (spiralSumClosed target)
