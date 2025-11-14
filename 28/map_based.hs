module Main where

target :: Integer
target = 1001

cornerSeq :: Integer -> [Integer]
cornerSeq n = concatMap corners [1 .. (n - 1) `div` 2]
  where
    corners k =
      let s = 2 * k + 1
       in map (\m -> s * s - m * (s - 1)) [0 .. 3]

main :: IO ()
main = print $ 1 + sum (cornerSeq target)
