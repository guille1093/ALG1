program TP20;
{Se tiene un array de registros donde se guardan las características de cada persona:
nombre, sexo, edad, peso, color de pelo, color de piel, color de ojos, nacionalidad y
teléfono.
Realizar un procedimiento que devuelva un nuevo array con la edad y el peso de las
personas que posean la nacionalidad y el sexo solicitados.}
uses
  crt,
  cthreads,
  Classes;
const
  a = 9;
type
  person = record
    fname, col_h, col_e, nac : string;
    gender : char;
    age, wgt, tel : integer;
  end;

  selected_person = record
    age, wgt: integer;
  end;

  S_AOR = array[1..a] of selected_person;
  AOR = array[1..a] of person;

var
  c: integer;
  cli : AOR;
  selected_cli : S_AOR;
  selected_sex : char;
  selected_nac : string;


procedure LoadData;
begin
  cli[1].fname := 'Pepe';
  cli[1].gender := 'M';
  cli[1].age := 30;
  cli[1].wgt := 80;
  cli[1].col_h := 'Castaño';
  cli[1].col_e := 'Marron';
  cli[1].nac := 'ARGENTINA';
  cli[1].tel := 123;

  cli[2].fname := 'Luis';
  cli[2].gender := 'M';
  cli[2].age := 27;
  cli[2].wgt := 70;
  cli[2].col_h := 'Rubio';
  cli[2].col_e := 'Negro';
  cli[2].nac := 'BRASIL';
  cli[2].tel := 345;

  cli[3].fname := 'Carla';
  cli[3].gender := 'F';
  cli[3].age := 45;
  cli[3].wgt := 66;
  cli[3].col_h := 'Negro';
  cli[3].col_e := 'Azul';
  cli[3].nac := 'ARGENTINA';
  cli[3].tel := 567;

  cli[4].fname := 'Daniel';
  cli[4].gender := 'M';
  cli[4].age := 32;
  cli[4].wgt := 75;
  cli[4].col_h := 'Castaño';
  cli[4].col_e := 'Verde';
  cli[4].nac := 'URUGUAY';
  cli[4].tel := 346;

  cli[5].fname := 'Pedro';
  cli[5].gender := 'M';
  cli[5].age := 34;
  cli[5].wgt := 79;
  cli[5].col_h := 'Rubio';
  cli[5].col_e := 'Marron';
  cli[5].nac := 'URUGUAY';
  cli[5].tel := 1236;

  cli[6].fname := 'Josefa';
  cli[6].gender := 'F';
  cli[6].age := 26;
  cli[6].wgt := 68;
  cli[6].col_h := 'Negro';
  cli[6].col_e := 'Negro';
  cli[6].nac := 'BRASIL';
  cli[6].tel := 561;

  cli[7].fname := 'Rita';
  cli[7].gender := 'F';
  cli[7].age := 13;
  cli[7].wgt := 70;
  cli[7].col_h := 'Castaño';
  cli[7].col_e := 'Azul';
  cli[7].nac := 'ARGENTINA';
  cli[7].tel := 875;

  cli[8].fname := 'Mariela';
  cli[8].gender := 'F';
  cli[8].age := 34;
  cli[8].wgt := 67;
  cli[8].col_h := 'Rubio';
  cli[8].col_e := 'Verde';
  cli[8].nac := 'ESPAÑA';
  cli[8].tel := 983;

  cli[9].fname := 'Mercedes';
  cli[9].gender := 'F';
  cli[9].age := 23;
  cli[9].wgt := 45;
  cli[9].col_h := 'Negro';
  cli[9].col_e := 'Negro';
  cli[9].nac := 'BOLIVIA';
  cli[9].tel := 654;
end;

procedure UserSelection;
var
  option, origen : string;
  sex : char;
begin
  repeat
    clrscr;
    option := '0';
    writeln('LA EDAD Y PESO DE LAS PERSONAS SELECCIONADAS SERAN MOSTRADAS');
    writeln;
    writeln('SELECCIONE UNA NACIONALIDAD: ');
    writeln;
    writeln('A) ARGENTINA');
    writeln('B) BRASILERA');
    writeln('C) URUGUAYA');
    writeln('D) BOLIVIANA');
    writeln('E) ESPAÑOLA');
    writeln;
    write('Ingrese una opcion (A,B,C,D,E): ');
    readln(option);
  until     (option = 'A') or (option = 'a')
         or (option = 'B') or (option = 'b')
         or (option = 'C') or (option = 'c')
         or (option = 'D') or (option = 'd')
         or (option = 'E') or (option = 'e');

  case option of
  'A', 'a': origen := 'ARGENTINA';
  'B', 'b': origen := 'BRASIL';
  'C', 'c': origen := 'URUGUAY';
  'D', 'd': origen := 'BOLIVIA';
  'E', 'e': origen := 'ESPAÑA';
  end;
  selected_nac := origen;
  clrscr;
  repeat
    option := '0';
    writeln('EL PAIS DE NACIONALIDAD SELECCIONADO ES: ',origen);
    writeln('');
    writeln('SELECCIONE LA OPCION CORRESPONDIENTE AL SEXO: ');
    writeln;
    writeln('A) MASCULINO');
    writeln('B) FEMENINO');
    writeln;
    write('Ingrese una opcion (A,B): ');
    readln(option);
  until     (option = 'A') or (option = 'a')
         or (option = 'B') or (option = 'b');
  clrscr;
  case option of
  'A', 'a': begin
              writeln('SELECCIONADOS: MASCULINOS CON NACIONALIDAD DE ',origen);
              sex := 'M';
            end;
  'B', 'b': begin
              writeln('SELECCIONADOS: FEMENINAS CON NACIONALIDAD DE ', origen);
              sex := 'F';
            end;
  end;
  selected_sex := sex;


end;

procedure DataProcess(var selected_cli:S_AOR);
var x: integer;
  begin
   for x := 1 to a do
     begin
       if (cli[x].nac = selected_nac) AND (cli[x].gender = selected_sex) then
         begin
           c := c+1;
           selected_cli[c].age := cli[x].age;
           selected_cli[c].wgt := cli[x].wgt;
         end;
     end;
end;

procedure PrintData;
var
  x : integer;
begin
  if c <> 0 then
    begin
      writeln(c, ' COINCIDENCIAS');
      writeln();
      writeln('        EDAD       PESO');
      for x := 1 to c do
        begin
          write('         ', selected_cli[x].age);
          write('         ', selected_cli[x].wgt);
          writeln;
        end;
    end
  else writeln('SIN COINCIDENCIAS DE BUSQUEDA');
end;

begin
  LoadData;
  UserSelection;
  DataProcess(selected_cli);
  PrintData;
  readln;
end.
