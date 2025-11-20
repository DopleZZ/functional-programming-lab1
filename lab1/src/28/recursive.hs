module Main where

target :: Integer
target = 1001

cornerSum :: Integer -> Integer
cornerSum k = 16 * k * k + 4 * k + 4

primeRec :: Integer -> Integer
primeRec 0 = 1
primeRec k = primeRec (k - 1) + cornerSum k

main :: IO ()
main = print (primeRec ((target - 1) `div` 2))
