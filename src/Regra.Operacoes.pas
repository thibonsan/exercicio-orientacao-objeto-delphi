unit Regra.Operacoes;

interface

uses
  System.SysUtils,
  Regra.Interfaces;

type
  TRegraOperacoes = class(TInterfacedObject, iRegrasOperacoes)
    private
      [weak]
      FParent : iRegras;
    public
      constructor Create(aParent : iRegras) ;
      destructor Destroy; override;
      class function New(aParent : iRegras) : iRegrasOperacoes;
      function CalcularPreco ( aValue : Currency ) : Currency; overload;
      function CalcularPreco ( aValue : String ) : Currency; overload;
  end;

implementation

{ TRegraOperacoes }

function TRegraOperacoes.CalcularPreco(aValue: Currency): Currency;
begin
  Result := (aValue * FParent.Parametros.Percent) + aValue;

  if Assigned(FParent.Parametros.Display) then
    FParent.Parametros.Display()(FParent.Parametros.Name + ' = ' + CurrToStr(Result));
end;

function TRegraOperacoes.CalcularPreco(aValue: String): Currency;
begin
  Result := 0;
  if TryStrToCurr(aValue, Result) then
    Result := CalcularPreco(StrToCurr(aValue));
end;

constructor TRegraOperacoes.Create(aParent : iRegras) ;
begin
  FParent := aParent;
end;

destructor TRegraOperacoes.Destroy;
begin

  inherited;
end;

class function TRegraOperacoes.New(aParent : iRegras) : iRegrasOperacoes;
begin
  Result := Self.Create(aParent);
end;

end.

