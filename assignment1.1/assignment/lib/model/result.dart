class Result{
  String? name;
  String? batch;
  int? oopmarks;
  int? androidmarks;
  int? apimarks;

  Result({
    this.name, 
    this.batch,
    this.oopmarks,
    this.androidmarks,
    this.apimarks,
  });

  double percentage(){
    return (oopmarks! + androidmarks! + apimarks!)/3;
  }

  String? grade(){
    if(oopmarks!<40 || androidmarks!<40 || apimarks!<40 ){
      return("Fail");
    }
    else{
      return("Pass");
    }
  }
}