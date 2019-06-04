postLogoutR :: Handler Html
postLogoutR = do 
    deleteSession "_ID"
    redirect HomeR
    
getAdminR :: Handler Html
getAdminR = do 
    defaultLayout $ do 
        [whamlet|
            <h1>
                BEM-VINDO ADMIN
        |]