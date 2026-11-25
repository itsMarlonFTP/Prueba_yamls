unit Calculadora;

interface

type
  TCalculadora = class
  public
    function Sumar(A, B: Integer): Integer;
    function Restar(A, B: Integer): Integer;
    function Multiplicar(A, B: Integer): Integer;
    function Dividir(A, B: Double): Double;
    function EsPar(N: Integer): Boolean;
  end;

implementation

uses
  System.SysUtils;

function TCalculadora.Sumar(A, B: Integer): Integer;
begin
  Result := A + B;
end;

function TCalculadora.Restar(A, B: Integer): Integer;
begin
  Result := A - B;
end;

function TCalculadora.Multiplicar(A, B: Integer): Integer;
begin
  Result := A * B;
end;

function TCalculadora.Dividir(A, B: Double): Double;
begin
  if B = 0 then
    raise EDivByZero.Create('No se puede dividir entre cero');
  Result := A / B;
end;

function TCalculadora.EsPar(N: Integer): Boolean;
begin
  Result := (N mod 2) = 0;
end;

end.
