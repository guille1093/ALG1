program TP10P2;


uses
  crt,
  Classes;

var
  i:integer;
  x:integer;
  UserInput:string;
  NewWord:string;
  NewString:string;
  TMPchar:char;
begin
  writeln('Porfavor ingrese una cadena de texto');
  readln(UserInput);
  UserInput:=UserInput+' ';
  UserInput:=upcase(UserInput);
  x:=1;
  i:=1;
  NewString:= '';
  NewWord:= '';
  TMPchar:= 'a';
  for i := 1 to length(UserInput) do
    begin
     TMPchar := UserInput[x];
     if (TMPchar <> ' ') AND (TMPchar <> '.') then
     begin
      NewWord:=NewWord+TMPchar;
     end
     else
     begin
       if (TMPchar = ' ') OR (TMPchar = '.') then
         if NewWord[1]='P' then
           NewString := NewString+'  '+NewWord;
        NewWord := '';
     end;
     x:=x+1;
    end;
  writeln ('Las palabras que empiezan con P son:  ',NewString);
end.
