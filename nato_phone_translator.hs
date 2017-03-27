import Data.Maybe
import Data.Char
import System.Environment

dictionary = [
  ('A', "Alfa"),('B', "Bravo"),('C', "Charlie"),('D', "Delta"),
  ('E', "Echo"),('F', "Foxtrot"),('G', "Golf"),('H', "Hotel"),
  ('I', "India"),('J', "Juliet"), ('K', "Kilo"), ('L', "Lima"),
  ('M', "Mike"), ('N', "November"), ('O', "Oscar"), ('P', "Papa"),
  ('Q', "Quebec"),('R', "Romeo"),('S', "Sierra"),('T', "Tango"),
  ('U', "Uniform"),('V', "Victor"),('W', "Whiskey"),  ('X', "X-ray"),
  ('Y', "Yankee"), ('Z', "Zulu"),
  ('0', "Zero"), ('1', "One"),('2', "Two"), ('3', "Three"),
  ('4', "Four"),('5', "Five"), ('6', "Six"), ('7', "Seven"),
  ('8', "Eight"),('9', "Niner"), ('.', "Point"),('-', "Dash"),
  (' ', " [Space] "), ('ñ', "Ñoño")
 ]

charToNatoPhone :: Char -> [Char]
charToNatoPhone x = fromMaybe "" $ lookup (toUpper x) dictionary


formatSpace :: Char -> Char -> [Char]
formatSpace x y
    | x == ' ' || y == ' ' = ""
    | otherwise  = " "

toNatoPhone :: [Char] -> [Char]
toNatoPhone [] = []
toNatoPhone [x] = charToNatoPhone x
toNatoPhone (x:y:xs) = (charToNatoPhone x) ++ (formatSpace x y) ++ (toNatoPhone (y:xs))

main = do
  args <- getArgs
  if length args == 1 then
    putStrLn $ toNatoPhone $ head args
  else putStrLn "Usage:\n\n\tnato_phone_translator \"string to translate\"\n"
