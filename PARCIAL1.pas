program PARCIAL1;


uses
  crt,
  StrUtils;

  var
    x:integer;
    resp:string;
    palabra:string;
    cadena:string;
    Char1:char;
    begin
        clrscr;
        repeat
            writeln('            Porfavor ingrese una cadena de texto terminada en punto,           ');
            writeln('   las palabras que empiecen con n y contengan 5 caracteres seran mostradas.      ');
            readln(resp);
            clrscr;
        until (resp[length(resp)]='.');
        clrscr;
        x:=1;
        cadena:= '';
        palabra:= '';
        Char1:= 'a';
        setlength(resp , length(resp)-1);
        resp:=resp+' .';
        repeat

          begin
            Char1 := resp[x];
            if Char1 in ['A'..'Z','a'..'z'] then
              begin
                palabra:=palabra+Char1;
              end
            else
              begin
                if (Char1 = ' ') then
                  if (palabra[1]='n') AND (length(palabra)=5) then
                    cadena := cadena+'  '+palabra;
                    palabra := '';
                end;
          x:=x+1;
          end;

        until (resp[x] = '.');

      writeln('              Las palabras que empiezan con n y tienen 5 caracteres son :                ');
      writeln('                * ',cadena,'');
      readln;
      clrscr;
    end.
