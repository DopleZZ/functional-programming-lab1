module Main where

-- Modular style: generate candidates, filter primes and divisors, then fold

target :: Integer
target = 600851475143

candidates :: Integer -> [Integer]
candidates m = [2 .. floor (sqrt (fromIntegral m))]

isDivisor :: Integer -> Integer -> Bool
isDivisor x m = m `mod` x == 0

isPrimeSimple :: Integer -> Bool
isPrimeSimple n
  | n < 2 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3,5 .. floor (sqrt (fromIntegral n))], n `mod` x == 0]

main :: IO ()
main = print (foldr max 1 divisors)
  where
    divisors = filter (`isDivisor` target) $ filter isPrimeSimple (candidates target)
