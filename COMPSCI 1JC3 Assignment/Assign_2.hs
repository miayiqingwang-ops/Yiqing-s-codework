-- |
-- Module      : 1JC3-Assign2.Assign_2.hs
-- Copyright   :  (c) Curtis D'Alves 2021
-- License     :  GPL (see the LICENSE file)
-- Maintainer  :  none
-- Stability   :  experimental
-- Portability :  portable
-- Description:
--   Assignment 2 - McMaster CS 1JC3 2022
module Assign_2 where

import Data.List
import Data.Maybe

-----------------------------------------------------------------------------------------------------------
-- INSTRUCTIONS              README!!!
-----------------------------------------------------------------------------------------------------------
-- 1) DO NOT DELETE/ALTER ANY CODE ABOVE THESE INSTRUCTIONS OR ADD/ALTER ANY IMPORTS
-- 2) DO NOT REMOVE / ALTER TYPE DECLERATIONS (I.E THE LINE WITH THE :: ABOUT THE FUNCTION DECLERATION)
--    IF YOU ARE UNABLE TO COMPLETE A FUNCTION, LEAVE IT'S ORIGINAL IMPLEMENTATION (I.E. THROW AN ERROR)
-- 3) MAKE SURE THE PROJECT COMPILES (I.E. RUN STACK BUILD AND MAKE SURE THERE ARE NO ERRORS) BEFORE
--    SUBMITTING, FAILURE TO DO SO WILL RESULT IN A MARK OF 0
-- 4) REPLACE macid = "TODO" WITH YOUR ACTUAL MACID (EX. IF YOUR MACID IS jim THEN macid = "jim")
-----------------------------------------------------------------------------------------------------------

-- Name: TODO add name
-- Date: TODO add date
macid :: String
macid = "wang46"

type Vector3D = (Double, Double, Double)

{- -----------------------------------------------------------------
 - getX
 - -----------------------------------------------------------------
 - Description:
 - |   Input     |
 - |      (x,y,z)      | 3-D vector input
 - -----------------------------------------------------------------
 - |   Output    |
 -   The output is the x-component of the given vector
 -}
getX :: Vector3D -> Double
getX (x, y, z) = x

{- -----------------------------------------------------------------
 - getY
 - -----------------------------------------------------------------
 - Description:
  - |   Input     |
 - |      (x,y,z)      | 3-D vector input
 - -----------------------------------------------------------------
 - |   Output    |
 -   The output is the yx-component of the given vector
 -}
getY :: Vector3D -> Double
getY (x, y, z) = y

{- -----------------------------------------------------------------
 - getZ
 - -----------------------------------------------------------------
 - Description:
  - |   Input     |
 - |      (x,y,z)      | 3-D vector input
 - -----------------------------------------------------------------
 - |   Output    |
 -   The output is the z-component of the given vector
 -}
getZ :: Vector3D -> Double
getZ (x, y, z) = z

{- -----------------------------------------------------------------
 - scalarMult
 - -----------------------------------------------------------------
 - Description:
  - |   Input     |
  - |      s      | scalar input
 - |     v     | 3-D vector input
 - -----------------------------------------------------------------
 - |   Output    |                                          - |     v=(x,y,z)     | (s*x,s*y,s*z)

 -}
scalarMult :: Double -> Vector3D -> Vector3D
scalarMult s v = (s * getX v, s * getY v, s * getZ v)

{- -----------------------------------------------------------------
 - add
 - -----------------------------------------------------------------
 - Description:
  - |   Input     |
  - |      v0    | 3-D vector input
 - |     v1    | 3-D vector input
 - -----------------------------------------------------------------
 - |   Output    |                                          - |  v0=(x0,y0,z0)  ,    v1=(x1,y1,z1)     | (x0+x1,y0+y1,z0+z1)

 -}
add :: Vector3D -> Vector3D -> Vector3D
add v0 v1 = (getX v1 + getX v0, getY v1 + getY v0, getZ v1 + getZ v0)

{- -----------------------------------------------------------------
 - innerProduct
 - -----------------------------------------------------------------
 - Description:
  - |   Input     |
  - |      v0    | 3-D vector input
 - |     v1    | 3-D vector input
 - -----------------------------------------------------------------
 - |   Output    |                                          - |  v0=(x0,y0,z0)  ,    v1=(x1,y1,z1)     | sqrt(x0*x1+y0*y1+z0*z1)
 -}
innerProduct :: Vector3D -> Vector3D -> Double
innerProduct v0 v1 = (getX v1) * (getX v0) + (getY v1) * (getY v0) + (getZ v1) * (getZ v0)

{- -----------------------------------------------------------------
 - distance
 - -----------------------------------------------------------------
 - Description:
  - |   Input     |
  - |      v2    | 3-D vector input
 - |     v1    | 3-D vector input
 - -----------------------------------------------------------------
 - |   Output    |                                         - |  v2=(x2,y2,z2)  ,    v1=(x1,y1,z1)     |
                sqrt(<v1-v2,v1-v2>)
 -}
distance :: Vector3D -> Vector3D -> Double
distance v1 v2 = sqrt (innerProduct v_dis v_dis)
  where
    v_dis = add v1 (scalarMult (-1) v2)

{- ------------------------------------------------------------------------
 - maxDistance
 - ------------------------------------------------------------------------
 - Description:
  - |   Input     |
  - |      vs    | list of 3-D vector input
 - -----------------------------------------------------------------
 - |   Output    |                                         - the element in the given list that with the largest distance from (0, 0, 0)
 - if the given list is empty, the output will just be (0,0,0)
 - if there are several elements that are all with the largest distance from (0, 0, 0) at the same time, the output will be the frontmost one of them.
 
 Example:
 input  -- maxDistance [(0,0,1),(0,1,0),(1,0,0)]
 output -- (0.0,0.0,1.0))

 input  -- maxDistance [(1,0,0),(0,1,0),(0,0,1)]
 output --(1.0,0.0,0.0)
 -}
compareDistance :: Double -> Vector3D -> [Vector3D] -> Vector3D
compareDistance dis a [] = a
compareDistance dis a b_list
  | new_dis > dis = compareDistance new_dis (head b_list) (tail b_list)
  | otherwise = compareDistance dis a (tail b_list)
  where
    new_dis = distance (head b_list) (0, 0, 0)

maxDistance :: [Vector3D] -> Vector3D
maxDistance [] = (0, 0, 0)
maxDistance vs = compareDistance 0 (0, 0, 0) vs