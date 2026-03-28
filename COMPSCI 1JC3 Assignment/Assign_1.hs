-- |
-- Module      : 1JC3-Assign1.Assign_1.hs
-- Copyright   :  (c) Curtis D'Alves 2021
-- License     :  GPL (see the LICENSE file)
-- Maintainer  :  none
-- Stability   :  experimental
-- Portability :  portable
-- Description:
--   Assignment 1 - McMaster CS 1JC3 2022
module Assign_1 where

import Prelude hiding (cos, sin, tan)

-----------------------------------------------------------------------------------------------------------
-- INSTRUCTIONS              README!!!
-----------------------------------------------------------------------------------------------------------
-- 1) DO NOT DELETE/ALTER ANY CODE ABOVE THESE INSTRUCTIONS OR ADD/ALTER IMPORTS
-- 2) DO NOT REMOVE / ALTER TYPE DECLERATIONS (I.E THE LINE WITH THE :: ABOUT THE FUNCTION DECLERATION)
--    IF YOU ARE UNABLE TO COMPLETE A FUNCTION, LEAVE IT'S ORIGINAL IMPLEMENTATION (I.E. THROW AN ERROR)
-- 3) MAKE SURE THE PROJECT COMPILES (I.E. RUN STACK BUILD AND MAKE SURE THERE ARE NO ERRORS) BEFORE
--    SUBMITTING, FAILURE TO DO SO WILL RESULT IN A MARK OF 0
-- 4) REPLACE macid = "TODO" WITH YOUR ACTUAL MACID (EX. IF YOUR MACID IS jim THEN macid = "jim")
-----------------------------------------------------------------------------------------------------------

-- Name: Yiqing Wang
-- Date: 2023/5/9
macid :: String
macid = "wang46"

{- -----------------------------------------------------------------
 - factorial
 - -----------------------------------------------------------------
 - Description:
 -    Computes the factorial of any Integer n
 - -----------------------------------------------------------------
 - |   Input     |                                                 |
 - |      n      | Integer input                                   |
 - -----------------------------------------------------------------
 - |   Output    |                                                 |
 - |      n <= 1 | 1                                               |
 - |      n >  1 | n * (n-1) ...  * 1   while (n-k) > 0            |
 - -----------------------------------------------------------------
 -}
factorial :: Integer -> Integer
factorial n =
  if n > 0
    then n * factorial (n -1)
    else 1

{- ------------------------------------------------------------------
 - sinTaylor
 - ------------------------------------------------------------------
 - Description:
 -    Computes the fourth Taylor polynomial approximation of sin(x) at a
 - -----------------------------------------------------------------
 - |   Input     |                                                 |
 - |     a     | the point where we want to find the fourth Taylor polynomial approximation near it
 - |    cos_a  | the value of cos(a)
 - |    sin_a  | the value of sin(a)
 - |     x     | the point near a where we want to find its fourth Taylor polynomial approximation of sin(x) 
 - -----------------------------------------------------------------
 - |   Output    |                                                 |
 - the fourth Taylor polynomial approximation of sin(x) at a
 - if the input are correct , the range of output should be (around) : 
 - -1 <= (output) <= 1
 -}
sinTaylor :: Double -> Double -> Double -> Double -> Double
sinTaylor a cos_a sin_a x =
  (sin_a / fromIntegral (factorial 0)) * (x - a) ** 0
    + (cos_a / fromIntegral (factorial 1)) * (x - a) ** 1
    - (sin_a / fromIntegral (factorial 2)) * (x - a) ** 2
    - (cos_a / fromIntegral (factorial 3)) * (x - a) ** 3
    + (sin_a / fromIntegral (factorial 4)) * (x - a) ** 4



{- -----------------------------------------------------------------
 - fmod
 - -----------------------------------------------------------------
 - Description:
 - |   Input     |                                                 |
 - |      x y     | floating input                                 |
 - -----------------------------------------------------------------
 - |   Output    |                                                 |
 - The remainder of x divided by y
 -  0 <= (output) < y
 -}
fmod :: Double -> Double -> Double
fmod x y = x - fromIntegral z * y
  where       
    z = floor a
    a=x/y
      

{- ----------------------------------------------------------------------
 - sinApprox
 - ----------------------------------------------------------------------
 - Description:
 - |   Input   | 
 - |     x     | the point near a where we want to find its fourth Taylor polynomial approximation of sin(x) , which is a floating

- |   Output    |                                                 |
- the fourth Taylor polynomial approximation of sin(x) near the closest chosen point
 - the range of output should be (around) : 
 - -1 <= (output) <= 1
-}


sinApprox :: Double -> Double
sinApprox x 
  |  y <  pi/4 = sinTaylor 0.0 1.0 0.0 y
  |  y < 3*pi/4 = sinTaylor (pi/2) 0.0 1.0 y
  |  y < 5*pi/4 = sinTaylor pi (-1.0) 0.0 y
  |  y < 7*pi/4 = sinTaylor (3*pi/2) 0.0 (-1.0) y
  |  otherwise = sinTaylor (2*pi) 1.0 0.0 y
    where 
      y=fmod x (2*pi)
{- ---------------------------------------------------------------------
 - cosApprox
 - ---------------------------------------------------------------------
 - Description:
  - |   Input   | 
 - |     x     | the point near a where we want to find its fourth Taylor polynomial approximation of cos(x) , which is a floating

- |   Output    |                                                 |
- the fourth Taylor polynomial approximation of tan(x) near the closest chosen point
 - the range of output should be (around) : 
 - -1 <= (output) <= 1
 -}
cosApprox :: Double -> Double
cosApprox x = (-1)*sinApprox (x-pi/2)

{- ---------------------------------------------------------------------
 - tanApprox
 - ---------------------------------------------------------------------
 - Description:
 - Description:
  - |   Input   | 
 - |     x     | the point near a where we want to find its fourth Taylor polynomial approximation of tan(x) , which is a floating

- |   Output    |                                                 |
- the fourth Taylor polynomial approximation of tan(x) near the closest chosen point
 - if The remainder of x divided by pi is very close to pi/2 or -pi/2, the output will be infinity or -infinity
 - otherwise, the output can be all real values 
 -}
tanApprox :: Double -> Double
tanApprox x = (sinApprox x)/(cosApprox x) 
  -- |(abs(fmod x (pi/2)))-pi/2<0.000001 =error "The value of tan(x) doesn't exist at this x"
