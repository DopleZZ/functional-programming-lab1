module Main where

target :: Integer
target = 600851475143

primes :: [Integer]
primes = sieve [2 ..]
  where
    sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p /= 0]
    sieve [] = []

primeFactorsUsingPrimes :: Integer -> [Integer]
primeFactorsUsingPrimes n = go n primes []
  where
    go m (p : ps) acc
      | p * p > m = if m > 1 then m : acc else acc
      | m `mod` p == 0 = go (m `div` p) (p : ps) (p : acc)
      | otherwise = go m ps acc

largestPrimeUsingPrimes :: Integer -> Integer
largestPrimeUsingPrimes = maximum . primeFactorsUsingPrimes

main :: IO ()
main = print (largestPrimeUsingPrimes target)
