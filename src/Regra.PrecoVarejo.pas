unit Regra.PrecoVarejo;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Operacoes;

type
  TRegraPrecoVarejo = class(TInterfacedObject, iRegras)
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

{ TRegraPrecoVarejo }

constructor TRegraPrecoVarejo.Create;
begin
  FParametros :=
  TRegraParametros
    .New(Self)
    .Name('Preço Varejo')
    .Percent(0.2);
end;

destructor TRegraPrecoVarejo.Destroy;
begin

  inherited;
end;

class function TRegraPrecoVarejo.New: iRegras;
begin
  Result := Self.Create;
end;

function TRegraPrecoVarejo.Operacoes: iRegrasOperacoes;
begin
  if not Assigned(FOperacoes) then
    FOperacoes := TRegraOperacoes.New(Self);

  Result := FOperacoes;
end;

function TRegraPrecoVarejo.Parametros: iRegrasParametros;
begin
  if not Assigned(FParametros) then
    FParametros := TRegraParametros.New(Self);

  Result := FParametros;
end;

initialization
  TRegraController.New.Registry(Integer(trVarejo), 'Preço Varejo');

end.

