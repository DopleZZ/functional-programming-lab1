module Main where

target :: Integer
target = 600851475143

primeFactorsTail :: Integer -> [Integer]
primeFactorsTail n = go n 2 []
  where
    go m f acc
      | f * f > m = if m > 1 then m : acc else acc
      | m `mod` f == 0 = go (m `div` f) f (f : acc)
      | otherwise = go m (f + 1) acc

main :: IO ()
main = print (maximum (primeFactorsTail target))
