getHomeR :: Handler Html
getHomeR = defaultLayout $ do
        setTitle "Sistreina" 
        customWidget $(whamletFile "templates/whamlet/home.hamlet")
        
getRespR :: Handler Html
getRespR = defaultLayout $ do
        setTitle "Sistreina" 
        respWidget $(whamletFile "templates/whamlet/home.hamlet")