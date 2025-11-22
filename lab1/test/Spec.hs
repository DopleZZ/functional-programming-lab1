{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import System.Exit (exitFailure)

-- Largest prime factor of 600851475143 should be 6857
targetPF :: Integer
targetPF = 600851475143

primeFactors :: Integer -> [Integer]
primeFactors n = go n 2 []
	where
		go m f acc
			| f * f > m = if m > 1 then m : acc else acc
			| m `mod` f == 0 = go (m `div` f) f (f : acc)
			| otherwise = go m (f + 1) acc

largestPrimeFactor :: Integer -> Integer
largestPrimeFactor = maximum . primeFactors

-- Spiral diagonals sum for 1001x1001 should be 669171001
spiralSize :: Integer
spiralSize = 1001

spiralDiagonalsSum :: Integer -> Integer
spiralDiagonalsSum n = ((16 * k * k * k + 30 * k * k + 26 * k) `div` 3) + 1
	where
		k = (n - 1) `div` 2

assert :: Bool -> String -> IO ()
assert cond msg = if cond then pure () else putStrLn ("FAIL: " ++ msg) >> exitFailure

main :: IO ()
main = do
	let lp = largestPrimeFactor targetPF
	assert (lp == 6857) $ "largestPrimeFactor expected 6857, got " ++ show lp
	let sd = spiralDiagonalsSum spiralSize
	assert (sd == 669171001) $ "spiralDiagonalsSum expected 669171001, got " ++ show sd
	putStrLn "All tests passed"
