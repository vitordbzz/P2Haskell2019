{-# LANGUAGE TemplateHaskell #-}

module Handler.Presenca where
 
import Import
import Database.Persist.Postgresql

data Presenca =  Obrigatoria | NaoObrigatoria deriving (Show, Eq, Read)

derivePersistField "Presenca"