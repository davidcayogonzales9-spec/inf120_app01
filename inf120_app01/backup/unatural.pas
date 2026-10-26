unit unatural;
{$mode ObjFPC}{$H+}

//DAVID CAYO

interface

uses
  Classes, SysUtils;
type

  { Natural }

  Natural=class
  private
    valor:integer;
  public
    //CONSTRUCTOR Y METODOS DE ACCESO
    constructor crear();
    procedure SetValor(val:integer);
    function GetValor():integer;
    //EJERCICIOS DEL PRACTICO
    function digCant():integer;
    function digSum():integer;
    function eliminar(dig:integer):integer;
    function pares():integer;
    function impares():integer;
    function primos():integer;
    function mayor():integer;
    function menor():integer;
    function invertir():integer;
    function capicua():boolean;
    function par():boolean;
    function impar():boolean;
    function primo():boolean;
    function binario():string;
    function octal():string;
    function hexadecimal():string;
    function baseN(base:integer):string;
    function romano():string;
    function literalNum():string;

end;

implementation

{ TNatural }

constructor Natural.crear();
begin
valor:=0;
end;

procedure Natural.SetValor(val: integer);
begin
valor:=val;
end;

function Natural.GetValor(): integer;
begin
result:=valor;
end;

function Natural.digCant(): integer;
var
cd,aux,dig:integer;
begin
cd:=0;
aux:= valor;
while(aux<>0)do
  begin
    dig:=aux mod 10;
    aux:=aux div 10;
    cd:=cd+1;
  end;
result:=cd;
end;

function Natural.digSum(): integer;
var
sum,aux,dig:integer;
begin
sum:=0;
aux:= valor;
while(aux<>0)do
  begin
    dig:=aux mod 10;
    aux:=aux div 10;
    sum:=sum+dig;
  end;
result:=sum;
end;

function Natural.eliminar(dig: integer): integer;
var
  aux,num,pot,d:integer;
begin
  aux:=valor;
  num:=0;
  pot:=1;
  while(aux<>0)do
    begin
      d:=aux mod 10;
      if(d<>dig)then
        begin
          num:=num+(d*pot);
          pot:=pot*10;
        end;
      aux:=aux div 10;
    end;
  result:=num;
end;

function Natural.pares(): integer;
var
  aux,d,cp:integer;
begin
  aux:=valor;
  cp:=0;
  while(aux<>0)do
    begin
      d:=aux mod 10;
      if(d mod 2=0)then
        cp:=cp+1;
      aux:=aux div 10;
    end;
  result:=cp;
end;

function Natural.impares(): integer;
var
  aux,d,ci:integer;
begin
  aux:=valor;
  ci:=0;
  while(aux<>0)do
    begin
      d:=aux mod 10;
      if(d mod 2<>0)then
        ci:=ci+1;
      aux:=aux div 10;
    end;
  result:=ci;
end;

function Natural.primos(): integer;
var
  aux,d,cp,i,c:integer;
begin
  aux:=valor;
  cp:=0;
  while(aux<>0)do
    begin
      d:=aux mod 10;
      c:=0;
      for i:=1 to d do
        begin
          if(d mod i=0)then
            c:=c+1;
        end;
      if(c=2)then
        cp:=cp+1;
      aux:=aux div 10;
    end;
  result:=cp;
end;

function Natural.mayor(): integer;
var
  aux,d,may:integer;
begin
  aux:=valor;
  may:=0;
  while(aux<>0)do
    begin
      d:=aux mod 10;
      if(d>may)then
        may:=d;
      aux:=aux div 10;
    end;
  result:=may;
end;

function Natural.menor(): integer;
var
  aux,d,men:integer;
begin
  aux:=valor;
  men:=9;
  while(aux<>0)do
    begin
      d:=aux mod 10;
      if(d<men)then
        men:=d;
      aux:=aux div 10;
    end;
  result:=men;
end;

function Natural.invertir(): integer;
var
  aux,inv,d:integer;
begin
  aux:=valor;
  inv:=0;
  while(aux<>0)do
    begin
      d:=aux mod 10;
      inv:=inv*10+d;
      aux:=aux div 10;
    end;
  result:=inv;
end;

function Natural.capicua(): boolean;
begin
  result:=valor=invertir();
end;

function Natural.par(): boolean;
begin
  result:=valor mod 2=0;
end;

function Natural.impar(): boolean;
begin
  result:=valor mod 2<>0;
end;

function Natural.primo(): boolean;
var
  i,c:integer;
begin
  c:=0;
  for i:=1 to valor do
    begin
      if(valor mod i=0)then
        c:=c+1;
    end;
  result:=c=2;
end;

function Natural.binario(): string;
begin
  result:=baseN(2);
end;

function Natural.octal(): string;
begin
  result:=baseN(8);
end;

function Natural.hexadecimal(): string;
begin
  result:=baseN(16);
end;

function Natural.baseN(base: integer): string;
const
  letras='0123456789ABCDEF';
var
  aux,res:string;
  num,r:integer;
begin
  num:=valor;
  res:='';
  while(num<>0)do
    begin
      r:=num mod base;
      res:=letras[r+1]+res;
      num:=num div base;
    end;
  result:=res;
end;

// ROMANO CON TU ESTILO ORIGINAL DE CASE POR POSICIONES
function Natural.romano(): string;
var
  mil, cen, deca, uni: Integer;
  milR, cenR, decR, uniR: String;
  t: Int64;
begin
  t := Abs(valor);
  mil := t div 1000;
  cen := (t mod 1000) div 100;
  deca := (t mod 100) div 10;
  uni := t mod 10;

  case mil of
    1: milR := 'M';
    2: milR := 'MM';
    3: milR := 'MMM';
  else milR := '';
  end;

  case cen of
    9: cenR := 'CM'; 8: cenR := 'DCCC'; 7: cenR := 'DCC'; 6: cenR := 'DC';
    5: cenR := 'D';  4: cenR := 'CD';   3: cenR := 'CCC'; 2: cenR := 'CC';
    1: cenR := 'C';  0: cenR := '';
  end;

  case deca of
    9: decR := 'XC'; 8: decR := 'LXXX'; 7: decR := 'LXX'; 6: decR := 'LX';
    5: decR := 'L';  4: decR := 'XL';   3: decR := 'XXX'; 2: decR := 'XX';
    1: decR := 'X';  0: decR := '';
  end;

  case uni of
    9: uniR := 'IX'; 8: uniR := 'VIII'; 7: uniR := 'VII'; 6: uniR := 'VI';
    5: uniR := 'V';  4: uniR := 'IV';   3: uniR := 'III'; 2: uniR := 'II';
    1: uniR := 'I';  0: uniR := '';
  end;

  Result := milR + cenR + decR + uniR;
end;

// LITERALNUM CON SDEC INTEGRADO
function Natural.literalNum(): string;
var
  mil, restoVal, cen, dec, uni: integer;
  sMil, sCen, sDec: string;
begin
  if valor = 0 then
    begin
      result := 'CERO';
      exit;
    end;

  if (valor < 0) or (valor > 9999) then
    begin
      result := 'Fuera de rango';
      exit;
    end;

  mil := valor div 1000;
  restoVal := valor mod 1000;
  cen := restoVal div 100;
  restoVal := restoVal mod 100;
  dec := restoVal div 10;
  uni := restoVal mod 10;

  sMil := '';
  case mil of
    1: sMil := 'MIL';
    2: sMil := 'DOS MIL';
    3: sMil := 'TRES MIL';
    4: sMil := 'CUATRO MIL';
    5: sMil := 'CINCO MIL';
    6: sMil := 'SEIS MIL';
    7: sMil := 'SIETE MIL';
    8: sMil := 'OCHO MIL';
    9: sMil := 'NUEVE MIL';
  end;

  sCen := '';
  case cen of
    1: if restoVal = 0 then sCen := 'CIEN' else sCen := 'CIENTO';
    2: sCen := 'DOSCIENTOS';
    3: sCen := 'TRESCIENTOS';
    4: sCen := 'CUATROCIENTOS';
    5: sCen := 'QUINIENTOS';
    6: sCen := 'SEISCIENTOS';
    7: sCen := 'SETECIENTOS';
    8: sCen := 'OCHOCIENTOS';
    9: sCen := 'NOVECIENTOS';
  end;

  sDec := '';
  if restoVal > 0 then
    begin
      case restoVal of
        1: sDec := 'UNO';
        2: sDec := 'DOS';
        3: sDec := 'TRES';
        4: sDec := 'CUATRO';
        5: sDec := 'CINCO';
        6: sDec := 'SEIS';
        7: sDec := 'SIETE';
        8: sDec := 'OCHO';
        9: sDec := 'NUEVE';
        10: sDec := 'DIEZ';
        11: sDec := 'ONCE';
        12: sDec := 'DOCE';
        13: sDec := 'TRECE';
        14: sDec := 'CATORCE';
        15: sDec := 'QUINCE';
        16: sDec := 'DIECISEIS';
        17: sDec := 'DIECISIETE';
        18: sDec := 'DIECIOCHO';
        19: sDec := 'DIECINUEVE';
        20: sDec := 'VEINTE';
        21: sDec := 'VEINTIUNO';
        22: sDec := 'VEINTIDOS';
        23: sDec := 'VEINTITRES';
        24: sDec := 'VEINTICUATRO';
        25: sDec := 'VEINTICINCO';
        26: sDec := 'VEINTISEIS';
        27: sDec := 'VEINTISIETE';
        28: sDec := 'VEINTIOCHO';
        29: sDec := 'VEINTINUEVE';
      else
        begin
          case dec of
            3: sDec := 'TREINTA';
            4: sDec := 'CUARENTA';
            5: sDec := 'CINCUENTA';
            6: sDec := 'SESENTA';
            7: sDec := 'SETENTA';
            8: sDec := 'OCHENTA';
            9: sDec := 'NOVENTA';
          end;

          if uni > 0 then
            begin
              case uni of
                1: sDec := sDec + ' Y UNO';
                2: sDec := sDec + ' Y DOS';
                3: sDec := sDec + ' Y TRES';
                4: sDec := sDec + ' Y CUATRO';
                5: sDec := sDec + ' Y CINCO';
                6: sDec := sDec + ' Y SEIS';
                7: sDec := sDec + ' Y SIETE';
                8: sDec := sDec + ' Y OCHO';
                9: sDec := sDec + ' Y NUEVE';
              end;
            end;
        end;
      end;
    end;

  result := '';
  if sMil <> '' then result := sMil;

  if sCen <> '' then
    begin
      if result <> '' then result := result + ' ';
      result := result + sCen;
    end;

  if sDec <> '' then
    begin
      if result <> '' then result := result + ' ';
      result := result + sDec;
    end;
end;

end.
