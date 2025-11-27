module Euler3.MapBased (largestPrimeFactorMapBased) where

candidates :: Integer -> [Integer]
candidates m = [2 .. floor (sqrt (fromIntegral m))]

isDivisor :: Integer -> Integer -> Bool
isDivisor x m = m `mod` x == 0

isPrimeSimple :: Integer -> Bool
isPrimeSimple n
  | n < 2 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3, 5 .. floor (sqrt (fromIntegral n))], n `mod` x == 0]

largestPrimeFactorMapBased :: Integer -> Integer
largestPrimeFactorMapBased n = foldr max 1 primeDivisors
  where
    cs = candidates n
    checked = zip cs (map (`isDivisor` n) cs)
    primeDivisors = [c | (c, True) <- checked, isPrimeSimple c]
