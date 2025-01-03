
class Pizza{

  int size =0;


  Pizza();

   int totalprice(){
    int total =0;
    if(size==1 ){
      total =5;


    }
    else if(size ==2) {
      total=7;

    }
    else{
      total =10;
    }
      return total;
  }



}