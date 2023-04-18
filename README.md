
## Calculators app
## APP type
this is simple calculators app


## key featuare
*clear 
*del
* equal =


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
![Test Image 4](https://github.com/isavtars/todeywith-provide/blob/unmodifiedlistview/photo_2023-03-15_15-41-43%20(2).jpg)
![Test Image 4](https://github.com/isavtars/todeywith-provide/blob/unmodifiedlistview/photo_2023-03-15_15-41-43.jpg)
![Test Image 4](https://github.com/isavtars/todeywith-provide/blob/unmodifiedlistview/photo_2023-03-15_15-41-42.jpg)




## Site link
host on github
- [the app that released on github link](https://isavtars.github.io/todoweb/#/)
