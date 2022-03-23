unit Regra.PrecoFeriado;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Operacoes;

type
  TRegraPrecoFeriado = class(TInterfacedObject, iRegras)
    private
      FOperacoes : iRegrasOperacoes;
      FParametros : iRegrasParametros;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iRegras;
      function Parametros : iRegrasParametros;
      function Operacoes : iRegrasOperacoes;
  end;

implementation

uses
  Regra.Controller, Regra.Tipo, Regra.Parametros;

{ TRegraPrecoFeriado }

constructor TRegraPrecoFeriado.Create;
begin
  FParametros :=
  TRegraParametros
    .New(Self)
    .Name('Preço Feriado')
    .Percent(0.3);
end;

destructor TRegraPrecoFeriado.Destroy;
begin

  inherited;
end;

class function TRegraPrecoFeriado.New: iRegras;
begin
  Result := Self.Create;
end;

function TRegraPrecoFeriado.Operacoes: iRegrasOperacoes;
begin
  if not Assigned(FOperacoes) then
    FOperacoes := TRegraOperacoes.New(Self);

  Result := FOperacoes;
end;

function TRegraPrecoFeriado.Parametros: iRegrasParametros;
begin
  if not Assigned(FParametros) then
    FParametros := TRegraParametros.New(Self);

  Result := FParametros;
end;

initialization
  TRegraController.New.Registry(Integer(trFeriado), 'Preço Feriado');

end.

