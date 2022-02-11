program TP10P3;


uses
  crt,
  StrUtils;
  var
    i:integer;
    x:integer;
    UserInput:string;
    NewWord:string;
    NewString:string;
    TMPchar:char;
    a:boolean;
    UserAnswer:string;
    begin
      repeat
        clrscr;
        writeln('//////////////////////////////////////////////////////////////////////////////////////');
        writeln('//////////////////////////////////////////////////////////////////////////////////////');
        writeln('//                                                                                  //');
        writeln('//                                                                                  //');
        writeln('//                                                                                  //');
        writeln('//                     Porfavor ingrese una cadena de texto                         //');
        writeln('//          las palabras que empiecen con D y contengan una A seran mostradas       //');
        writeln('//                                                                                  //');
        writeln('//                                                                                  //');
        writeln('//                                                                                  //');
        writeln('//////////////////////////////////////////////////////////////////////////////////////');
        writeln('//////////////////////////////////////////////////////////////////////////////////////');
        readln(UserInput);
        clrscr;
        UserInput:=UserInput+' ';
        UserInput:=upcase(UserInput);
        x:=1;
        i:=1;
        a:=false;
        NewString:= '';
        NewWord:= '';
        TMPchar:= 'a';
        for i := 1 to length(UserInput) do
          begin
            TMPchar := UserInput[x];
            if ((ord(TMPchar) > 64) AND ((ord(TMPchar) < 91))) then //filtra por ordinales
//            if TMPchar in ['A'..'Z'] then //filtra por rango
              begin
                NewWord:=NewWord+TMPchar;
                if TMPchar='A' then
                  begin
                    a:=true
                  end;
              end
            else
              begin
                if (TMPchar = ' ') OR (TMPchar = '.') then
                  if (NewWord[1]='D') AND (a=true) then
                    NewString := NewString+'  '+NewWord;
                    NewWord := '';
                    a:=false;
                end;
          x:=x+1;
          end;
      writeln('//////////////////////////////////////////////////////////////////////////////////////');
      writeln('//////////////////////////////////////////////////////////////////////////////////////');
      writeln('//                                                                                  //');
      writeln('//                                                                                  //');
      writeln('//                                                                                  //');
      writeln('//               Las palabras que empiezan con D y contienen una A son:             //');
      writeln('//               ',NewString,'                                                      //');
      writeln('//                                                                                  //');
      writeln('//                                                                                  //');
      writeln('//                                                                                  //');
      writeln('//////////////////////////////////////////////////////////////////////////////////////');
      writeln('//////////////////////////////////////////////////////////////////////////////////////');
      readln;
      clrscr;
      repeat
          writeln('//////////////////////////////////////////////////////////////////////////////////////');
          writeln('//////////////////////////////////////////////////////////////////////////////////////');
          writeln('//                                                                                  //');
          writeln('//                                                                                  //');
          writeln('//                                                                                  //');
          writeln('//               Desea seguir utilizando el programa? S/N:                          //');
          writeln('//                                                                                  //');
          writeln('//                                                                                  //');
          writeln('//                                                                                  //');
          writeln('//                                                                                  //');
          writeln('//////////////////////////////////////////////////////////////////////////////////////');
          writeln('//////////////////////////////////////////////////////////////////////////////////////');
          readln(UserAnswer);
          clrscr;
      until (UserAnswer = 'S') or (UserAnswer = 's') or (UserAnswer = 'N') or (UserAnswer = 'n');
    until (UserAnswer = 'N') or (UserAnswer = 'n');
    end.
