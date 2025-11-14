module Main where


target :: Integer
target = 1001

-- List comprehension based generation of all corner values
-- for layers k = 1..(n-1)/2. For layer k, side length s = 2k+1.
-- The corners are s^2 - m*(s-1) for m in [0..3].
main :: IO ()
main = print $ 1 + sum [ s*s - m*(s-1)
                       | k <- [1 .. (target - 1) `div` 2]
                       , let s = 2*k + 1
                       , m <- [0..3]
                       ]
