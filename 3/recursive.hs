module Main where

target :: Integer
target = 600851475143

smallestFactor :: Integer -> Integer
smallestFactor n = sf n 2
  where
    sf m f
      | f * f > m = m
      | m `mod` f == 0 = f
      | otherwise = sf m (f + 1)

primeFactorsRec :: Integer -> [Integer]
primeFactorsRec n
  | n <= 1 = []
  | otherwise = let f = smallestFactor n in f : primeFactorsRec (n `div` f)

main :: IO ()
main = print (maximum (primeFactorsRec target))
