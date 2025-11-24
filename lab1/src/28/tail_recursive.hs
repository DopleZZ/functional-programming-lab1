module Main where

target :: Integer
target = 1001

spiralSumTail :: Integer -> Integer
spiralSumTail n = go 1 1
  where
    m = (n - 1) `div` 2
    go k acc
      | k > m = acc
      | otherwise = go (k + 1) (acc + cornerSum k)

cornerSum :: Integer -> Integer
cornerSum k = 16 * k * k + 4 * k + 4

main :: IO ()
main = print (spiralSumTail target)
