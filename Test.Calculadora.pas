unit Test.Calculadora;

interface

uses
  DUnitX.TestFramework,
  Calculadora;

type
  [TestFixture]
  TTestCalculadora = class
  private
    FCalc: TCalculadora;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure Sumar_DosPositivos_RetornaSuma;

    [Test]
    [NamedTestCase('Positivos', '2,3,5')]
    [NamedTestCase('Negativos', '-2,-3,-5')]
    [NamedTestCase('Con cero', '0,7,7')]
    procedure Sumar_VariosCasos(A, B, Esperado: Integer);

    [Test]
    procedure Restar_DosNumeros_RetornaDiferencia;

    [Test]
    procedure Multiplicar_PorCero_RetornaCero;

    [Test]
    procedure Dividir_DosNumeros_RetornaCociente;

    [Test]
    procedure Dividir_EntreCero_LanzaExcepcion;

    [Test]
    [NamedTestCase('Par', '4,True')]
    [NamedTestCase('Impar', '7,False')]
    [NamedTestCase('Cero', '0,True')]
    procedure EsPar_VariosCasos(N: Integer; Esperado: Boolean);
  end;

implementation

uses
  System.SysUtils;

procedure TTestCalculadora.Setup;
begin
  FCalc := TCalculadora.Create;
end;

procedure TTestCalculadora.TearDown;
begin
  FCalc.Free;
end;

procedure TTestCalculadora.Sumar_DosPositivos_RetornaSuma;
begin
  Assert.AreEqual(5, FCalc.Sumar(2, 3));
end;

procedure TTestCalculadora.Sumar_VariosCasos(A, B, Esperado: Integer);
begin
  Assert.AreEqual(Esperado, FCalc.Sumar(A, B));
end;

procedure TTestCalculadora.Restar_DosNumeros_RetornaDiferencia;
begin
  Assert.AreEqual(2, FCalc.Restar(5, 3));
end;

procedure TTestCalculadora.Multiplicar_PorCero_RetornaCero;
begin
  Assert.AreEqual(0, FCalc.Multiplicar(9, 0));
end;

procedure TTestCalculadora.Dividir_DosNumeros_RetornaCociente;
begin
  Assert.AreEqual(2.5, FCalc.Dividir(5, 2), 0.0001);
end;

procedure TTestCalculadora.Dividir_EntreCero_LanzaExcepcion;
begin
  Assert.WillRaise(
    procedure
    begin
      FCalc.Dividir(10, 0);
    end,
    EDivByZero);
end;

procedure TTestCalculadora.EsPar_VariosCasos(N: Integer; Esperado: Boolean);
begin
  if Esperado then
    Assert.IsTrue(FCalc.EsPar(N))
  else
    Assert.IsFalse(FCalc.EsPar(N));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestCalculadora);

end.
