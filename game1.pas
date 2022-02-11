program GAME1;


uses
  crt,
  Classes;

var
  answer:integer;
  guess:integer;
  cnt:integer;
  error:integer;
  game:char;
  UI:string;


begin
  repeat
    cnt := 0;
    repeat
      clrscr;
      writeln('ADIVINA EL NUMERO :D');
      writeln;
      writeln('Seleccione un Juego: ');
      writeln;
      writeln('A) 10 POSIBILIDADES');
      writeln('B) 100 POSIBILIDADES');
      writeln('C) 1000 POSIBILIDADES');
      writeln;
      write('Ingrese una opcion: ');
      readln(game);
    until (game = 'A') or (game = 'a') or (game = 'B') or (game = 'b')
           or (game = 'C') or (game = 'c');

    clrscr;

    randomize;

    case game of
    'A', 'a': begin
                answer := random(10)+1;
                writeln('Juego 1 - 10');
              end;
    'B', 'b': begin
                answer := random(100)+1;
                writeln('Juego 1 - 100');
              end;
    'C', 'c': begin
                answer := random(1000)+1;
                writeln('Juego 1 - 1000');
              end;
    end;

    repeat
      repeat
        writeln;
        write('Ingrese su estimacion: ');
        readln(UI);
        val(UI,guess,error);
        if error <> 0 then
          writeln('Ingrese un numero valido');
      until error = 0;

      cnt := cnt + 1;

      if guess < answer then
        writeln('Muy bajo!')
      else if guess > answer then
        writeln('Muy alto!')
      else
        writeln('ADIVINASTE EL NUMERO EN ', cnt, ' INTENTOS!');

    until  guess = answer;

    writeln;

    repeat
      write('Jugar devuelta? S/N: ');
      readln(game);

    until (game = 'S') or (game = 's') or (game = 'N') or (game = 'n');

  until (game = 'N') or (game = 'n');

end.
