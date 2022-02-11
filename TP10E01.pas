program TP10P1;


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
         if length(NewWord)=5 then
           NewString := NewString+'  '+NewWord;
        NewWord := '';
     end;
     x:=x+1;
    end;
  writeln ('Las palabras con 5 caracteres son:  ',NewString);
end.
