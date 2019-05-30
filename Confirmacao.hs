{-# LANGUAGE TemplateHaskell #-}

module Handler.Confirmacao where

import Import
import Database.Persist.Postgresql

data Confirmacao = Confirmada | NaoConfirmada deriving (Show, Eq, Read)

derivePersistField "Confirmacao"