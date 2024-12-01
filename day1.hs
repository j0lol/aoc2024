import Control.Monad
import Data.Bifunctor
import Data.List (sort)
import Stdlib

main :: IO ()
main = do
  contents <- readFile "day1.input"
  print $ solution_pt2 contents

-- thanks stackoverbros
tupMap = join bimap

distance :: Int -> Int -> Int
distance x y = abs (x - y)

solution :: String -> Int
solution s = sum
             $ map (uncurry distance)
             $ uncurry zip
             $ tupMap (sort . map read)
             $ unzip
             $ munchf katsu s

leftInRight :: [Int] -> Int -> Int
leftInRight y x = sum $ map (fromEnum . (x==)) y

sumsInRight :: [Int] -> [Int] -> [Int]
sumsInRight x y = map (\i -> i * leftInRight y i) x

solution_pt2 :: String -> Int
solution_pt2 s = sum
                 $ uncurry sumsInRight
                 $ tupMap (map read)
                 $ unzip
                 $ munchf katsu s
