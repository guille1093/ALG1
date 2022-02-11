program TPARCHIVOS;

uses cthreads, sysutils, crt, classes;

type
  person = record
    nlg, map, cmap : integer;
    apn, cond      : string;
  end;
  f_ofperson = file of person;

  list = record
    nlg : integer;
    desc: string;
    nota: char;
  end;
  f_oflist = file of list;
  ct = array of integer;


var
  fl:  f_oflist;
  mr:  list;
  f:   f_ofperson;
  alu: person;


procedure LoadDataMAT(var mr:list; var fl: f_oflist);
begin
  assignfile(fl, 'MATERIAS_RENDIDAS.DAT');
  rewrite(fl);

  mr.nlg   := 10;
  mr.desc  := 'MATEMATICA 1  ';
  mr.nota  := 'A';
  write(fl, mr);

  mr.nlg   := 10;
  mr.desc  := 'INGLES 1      ';
  mr.nota  := 'A';
  write(fl, mr);

  mr.nlg   := 10;
  mr.desc  := 'ALGORITMOS 1  ';
  mr.nota  := 'D';
  write(fl, mr);

  mr.nlg   := 20;
  mr.desc  := 'ALGORITMOS 1  ';
  mr.nota  := 'D';
  write(fl, mr);

  mr.nlg   := 40;
  mr.desc  := 'INGLES 1      ';
  mr.nota  := 'A';
  write(fl, mr);

  mr.nlg   := 40;
  mr.desc  := 'INGLES 2      ';
  mr.nota  := 'A';
  write(fl, mr);

  mr.nlg   := 50;
  mr.desc  := 'ALGORITMOS 1  ';
  mr.nota  := 'D';
  write(fl, mr);

  mr.nlg   := 50;
  mr.desc  := 'MATEMATICA 1  ';
  mr.nota  := 'A';
  write(fl, mr);

  close(fl);
end;

procedure LoadDataALU(var alu:person; var f: f_ofperson);

begin

  assignfile(f, 'ALUMNOS.DAT');
  rewrite(f);

  alu.nlg := 10;
  alu.apn := 'Roger Federer  ';
  alu.map := 18;
  alu.cmap:= 36;
  alu.cond:= 'Regular';
  write(f, alu);

  alu.nlg := 20;
  alu.apn := 'Novak Djokovic  ';
  alu.map := 05;
  alu.cmap:= 36;
  alu.cond:= 'Regular';
  write(f, alu);

  alu.nlg := 30;
  alu.apn := 'Rafael Nadal   ';
  alu.map := 26;
  alu.cmap:= 28;
  alu.cond:= 'Libre';
  write(f, alu);

  alu.nlg := 40;
  alu.apn := 'Andrew Murray  ';
  alu.map := 15;
  alu.cmap:= 28;
  alu.cond:= 'Libre';
  write(f, alu);

  alu.nlg := 50;
  alu.apn := 'Juan Del Potro ';
  alu.map := 10;
  alu.cmap:= 36;
  alu.cond:= 'Regular';
  write(f, alu);

  close(f);
end;

procedure PrintDataMaster(var alu:person; var f: f_ofperson);
begin
  writeln('======================================================================');
  writeln('=====================ARCHIVO MAESTRO DE ALUMNOS=======================');
  writeln('NRO LEGAJO | APELLIDO Y NOMBRE | M. APROBADAS | M.PLAN | CONDICION  |');
  reset(f);
  while not eof(f) do
  begin
   read(f, alu);
   writeln('  ',alu.nlg,'           ',alu.apn,'       ',alu.map,'            ',alu.cmap,'     ',alu.cond);
  end;
  writeln('======================================================================');
  close(f);
end;

procedure PrintDataUpdate(var alu:person; var f: f_ofperson);
begin
  writeln('======================================================================');
  writeln('======LISTA ACTUALIZADA DE LOS ALUMNOS Y SUS MATERIAS RESTANTES=======');
  writeln('NRO LEGAJO | APELLIDO Y NOMBRE | M. FALTANTES | CONDICION  | ');
  reset(f);
  while not eof(f) do
  begin
   read(f, alu);
   writeln('  ',alu.nlg,'           ',alu.apn,'       ',(alu.cmap - alu.map),'            ',alu.cond,'     ');
  end;
  close(f);
  writeln('======================================================================');
end;

procedure PrintDataList(var mr:list; var fl: f_oflist);
begin
  writeln('======================================================================');
  writeln('=====================ARCHIVO MATERIAS_RENDIDAS.DAT====================');
  writeln('NRO LEGAJO |  DESCRIPCION  |    NOTA    |');
  reset(fl);
  while not eof(fl) do
  begin
   read(fl, mr);
   writeln('  ',mr.nlg,'          ',mr.desc,'     ',mr.nota);
  end;
  writeln('======================================================================');
  close(fl);
end;

procedure DataProcess(var mr:list; var fl: f_oflist; var alu:person; var f: f_ofperson);
var high,highpos,c,x:integer;cache : ct;
begin
    reset(f);
    setLength(cache,(FileSize(f)+1));    //ACA TENGO UN PROBLEMA QUE "SOLUCIONE" AÑADIENDO UNA POSICION MAS A MI ARRAY//
    close(f);                            //PORQUE EL ERROR SE GENERA UNICAMENTE EN LA ULTIMA UBICACION ASIGNANDOME    //
    reset(fl);                           //VALORES EXTRAÑOS CUANDO EN NINGUN MOMENTO LE ASIGNE VALORES A ESA POSICION //
    for c:=0 to (filesize(fl)-1) do      //OPTE POR DEJARLO AHI Y SIMPLMENTE NO ACCEDER A LA POSICION YA QUE OBVIANDO //
    begin                                //ESO EL PROGRAMA SE COMPORTA ACORDE. ESTE ERROR SOLO SUCEDE EN EL ARRAY     //
     read(fl, mr);                       //TEMPORAL DEL PROCEDIMIENTO Y NO SE TRANSFIERE A LOS ARCHIVOS               //
     if (mr.nota = 'A') then cache[(mr.nlg div 10)] := cache[(mr.nlg div 10)] + 1;
    end;
    close(fl);
    high := cache[1];
    highpos := 1;
    writeln('======================================================================');
    writeln('=============ALUMNOS A ACTUALIZAR EN EL ARCHIVO MAESTRO===============');
    writeln('NRO LEGAJO  |  CANT MATERIAS APROBADAS');
    for x:= 1 to (length(cache)-1) do //ACA ES DONDE LE DIGO A MI FOR QUE IGNORE EL ULTIMO REGISTRO QUE FUE RESERVADO
      begin                           //EXCLUSIVAMENTE PARA EL "ERROR"...
         if (cache[x]<>0) then writeln('   ',x,'0', '                    ',cache[x]);
         if cache[x] > high then
            begin
              highpos := x;
              high := cache[x];
            end;
      end;
    reset(f);
    writeln('======================================================================');
    while not eof(f) do
    begin
      read(f,alu);
      alu.map := alu.map + cache[(alu.nlg div 10)];
      seek(f,(filepos(f)-1));
      write(f, alu);
      if (cache[(alu.nlg div 10)] >= 2) then alu.cond:='REGULAR' else alu.cond:='LIBRE';
      seek(f,(filepos(f)-1));
      write(f, alu);
    end;
    seek(f,highpos-1);
    read(f,alu);
    writeln('EL ALUMNO CON MAS MATERIAS APROBADAS ES ',alu.apn,'CON ',high, ' MATERIAS');
    writeln('======================================================================');
    writeln('');
    close(f);
    writeln(cache[length(cache)]); //ACA SE IMPRIME EL VALOR EXTRAÑO QUE APARECE EN LA ULTIMA POSICION DEL ARRAY
end;

begin
  clrscr;
  LoadDataALU(alu,f);
  PrintDataMaster(alu,f);
  LoadDataMAT(mr,fl);
  PrintDataList(mr,fl);
  DataProcess(mr,fl,alu,f);
  PrintDataUpdate(alu,f);
end.
