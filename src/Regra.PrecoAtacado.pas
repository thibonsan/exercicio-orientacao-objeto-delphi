unit Regra.PrecoAtacado;

interface

uses
  Regra.Interfaces, System.SysUtils, Regra.Operacoes;

type
  TRegraPrecoAtacado = class(TInterfacedObject, iRegras)
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

{ TRegraPrecoAtacado }

constructor TRegraPrecoAtacado.Create;
begin
  FParametros :=
  TRegraParametros
    .New(Self)
    .Name('Preço Atacado')
    .Percent(0.1);
end;

destructor TRegraPrecoAtacado.Destroy;
begin

  inherited;
end;

class function TRegraPrecoAtacado.New: iRegras;
begin
  Result := Self.Create;
end;

function TRegraPrecoAtacado.Operacoes: iRegrasOperacoes;
begin
  if not Assigned(FOperacoes) then
    FOperacoes := TRegraOperacoes.New(Self);

  Result := FOperacoes;
end;

function TRegraPrecoAtacado.Parametros: iRegrasParametros;
begin
  if not Assigned(FParametros) then
    FParametros := TRegraParametros.New(Self);

  Result := FParametros;
end;

initialization
  TRegraController.New.Registry(Integer(trAtacado), 'Preço Atacado');

end.

