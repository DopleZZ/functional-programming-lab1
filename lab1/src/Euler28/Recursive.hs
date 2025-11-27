module Euler28.Recursive (spiralSumRec) where

cornerSum :: Integer -> Integer
cornerSum k = 16 * k * k + 4 * k + 4

spiralSumRec :: Integer -> Integer
spiralSumRec n = primeRec ((n - 1) `div` 2)
	where
		primeRec 0 = 1
		primeRec k = primeRec (k - 1) + cornerSum k
