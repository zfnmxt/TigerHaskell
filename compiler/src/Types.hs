module Types where

import AST

data Ty = Int
        | String
        | Record [(Id, Ty)]
        | Array Ty
        | Nil
        | Unit
        deriving (Show, Eq)


(|>) :: Ty -> Ty -> Bool
Nil |> Record _      = True
Record xs |> Record ys = and $ zipWith (\(_, tx) (_, ty) -> tx |> ty) xs ys
Int |> Int           = True
String |> String     = True
Array x |> Array y   = x |> y
Nil |> Nil           = True
Unit |> Unit         = True

