
## Calculators app
## APP type
this is simple calculators app


## key featuare
*  clear  (clear the input output feild)
*  del    ( delete the last index of input )
* equal = (calculated the all math expression)
* darkmodek 


## Technic and technoogy
flutter
Get x (to mange the state)

math_expressions for doin 

 equalPressed() {
 
    String userInputFC = userInput;
    
    userInputFC = userInputFC.replaceAll("x", "*");
    
    Parser p = Parser();
    
    Expression exp = p.parse(userInputFC);
    
    ContextModel ctx = ContextModel();
    
    double eval = exp.evaluate(EvaluationType.REAL, ctx);

    userOutput = eval.toString();
   
  }


## ui/ux
![Test Image 4](https://github.com/isavtars/calculators/blob/master/photo_2023-04-18_15-27-15.jpg)
![Test Image 4](https://github.com/isavtars/calculators/blob/master/photo_2023-04-18_15-27-15%20(2).jpg)





## Site link
host on github
- [the app that released on github link](https://isavtars.github.io/todoweb/#/)
