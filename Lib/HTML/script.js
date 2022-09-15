var el = document.getElementsByTagName("li");

for(var i = 0; i < el.length; i++) {

    el[i].addEventListener('click', function(){

        if(this.classList.contains('mystyle1')){

            this.classList.remove("mystyle1");
            
            this.className += " mystyle2";
            

        }else{

            if(this.classList.contains('mystyle2')){

                this.classList.remove("mystyle2");
            }

            
            this.className += " mystyle1";

        }



    });
}





