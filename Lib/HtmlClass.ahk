class HtmlClass{

    __New(iconFolder){

        this.htmlText := ""
        this.imageFolder := iconFolder
        this.functionText := ""
    }

    Add(className, mytooltip, myfunction, imageName){
        
        this.functionText .= myfunction . "(neutron, event){`n`n`tRun, calc`n}`n`n"

        imageFile := this.imageFolder . imageName

        this.htmlText .= "`t<li class=""icon " . className . """>`n`t`t<span class=""tooltip"">" . mytooltip . "</span>`n`t`t<img src=""" . imageFile . """ onClick=""ahk." . myfunction . "(event)"" alt=""""/>`n`t</li>`n`n"

    }

    StartList(){
        this.htmlText .= "<ul class=""wrapper"">`n`n" 
    }

    EndList(){
        this.htmlText .= " </ul>`n`n"              
    }

    GetHTML(){
        return this.htmlText
    }


}




