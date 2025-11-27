module Euler3.TailRecursive (largestPrimeFactorTail) where

primeFactorsTail :: Integer -> [Integer]
primeFactorsTail n = go n 2 []
  where
    go m f acc
      | f * f > m = if m > 1 then m : acc else acc
      | m `mod` f == 0 = go (m `div` f) f (f : acc)
      | otherwise = go m (f + 1) acc

largestPrimeFactorTail :: Integer -> Integer
largestPrimeFactorTail = maximum . primeFactorsTail
