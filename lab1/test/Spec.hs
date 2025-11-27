{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import System.Exit (exitFailure)

import Euler3.InfinitePrimes (largestPrimeUsingPrimes)
import Euler3.ListComp (largestPrimeFactorListComp)
import Euler3.MapBased (largestPrimeFactorMapBased)
import Euler3.Modular (largestPrimeFactorModular)
import Euler3.Recursive (largestPrimeFactorRec)
import Euler3.TailRecursive (largestPrimeFactorTail)
import Euler28.ClosedForm (spiralSumClosed)
import Euler28.Infinite (spiralSumInfinite)
import Euler28.ListComp (spiralSumListComp)
import Euler28.MapBased (spiralSumMapBased)
import Euler28.Modular (spiralSumModular)
import Euler28.Recursive (spiralSumRec)
import Euler28.TailRecursive (spiralSumTail)

targetPF :: Integer
targetPF = 600851475143

expectedLargestPrimeFactor :: Integer
expectedLargestPrimeFactor = 6857

spiralSize :: Integer
spiralSize = 1001

expectedSpiralSum :: Integer
expectedSpiralSum = 669171001

assert :: Bool -> String -> IO ()
assert cond msg = if cond then pure () else putStrLn ("FAIL: " ++ msg) >> exitFailure

main :: IO ()
main = do
  assert (largestPrimeFactorTail targetPF == expectedLargestPrimeFactor) "largestPrimeFactorTail"
  assert (largestPrimeFactorRec targetPF == expectedLargestPrimeFactor) "largestPrimeFactorRec"
  assert (largestPrimeFactorModular targetPF == expectedLargestPrimeFactor) "largestPrimeFactorModular"
  assert (largestPrimeFactorMapBased targetPF == expectedLargestPrimeFactor) "largestPrimeFactorMapBased"
  assert (largestPrimeFactorListComp targetPF == expectedLargestPrimeFactor) "largestPrimeFactorListComp"
  assert (largestPrimeUsingPrimes targetPF == expectedLargestPrimeFactor) "largestPrimeUsingPrimes"
  assert (spiralSumTail spiralSize == expectedSpiralSum) "spiralSumTail"
  assert (spiralSumRec spiralSize == expectedSpiralSum) "spiralSumRec"
  assert (spiralSumModular spiralSize == expectedSpiralSum) "spiralSumModular"
  assert (spiralSumMapBased spiralSize == expectedSpiralSum) "spiralSumMapBased"
  assert (spiralSumListComp spiralSize == expectedSpiralSum) "spiralSumListComp"
  assert (spiralSumClosed spiralSize == expectedSpiralSum) "spiralSumClosed"
  assert (spiralSumInfinite spiralSize == expectedSpiralSum) "spiralSumInfinite"
  putStrLn "All tests passed"