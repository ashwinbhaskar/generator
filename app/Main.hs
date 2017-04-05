{-# LANGUAGE DeriveGeneric #-}
import qualified Data.ByteString.Char8 as BS
import qualified Data.Yaml as Y
import GHC.Generics
import Data.Aeson


data Cred = Cred { test :: [Char]} deriving (Show, Generic) -- (1,2)
instance FromJSON Cred -- (3)

main :: IO ()
main = do
    content <- BS.readFile "input.yaml" -- (4)
    let parsedContent = Y.decode content :: Maybe Cred -- (5)
    case parsedContent of
        Nothing -> error "Could not parse config file."
        (Just (Cred u)) -> putStrLn ("test-with-ghc: " ++ u)