module Main where

target :: Integer
target = 600851475143

candidates :: Integer -> [Integer]
candidates m = [2 .. floor (sqrt (fromIntegral m))]

isPrimeSimple :: Integer -> Bool
isPrimeSimple n
  | n < 2 = False
  | n == 2 = True
  | even n = False
  | otherwise = null [x | x <- [3, 5 .. floor (sqrt (fromIntegral n))], n `mod` x == 0]

main :: IO ()
main = print (maximum [x | x <- candidates target, target `mod` x == 0, isPrimeSimple x])
