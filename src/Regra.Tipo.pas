unit Regra.Tipo;

interface

uses
  Regra.Interfaces,
  Regra.PrecoFeriado,
  Regra.PrecoAtacado,
  Regra.PrecoVarejo;

type
  TEnumRegras = (trFeriado, trAtacado, trVarejo);

  TEnumRegrasHelper = record Helper for TEnumRegras
    function this : iRegras;
  end;

implementation

{ TEnumRegrasHelper }

function TEnumRegrasHelper.this: iRegras;
begin
  case Self of
    trFeriado: Result := TRegraPrecoFeriado.Create;
    trAtacado: Result := TRegraPrecoAtacado.Create;
    trVarejo:  Result := TRegraPrecoVarejo.Create;
  end;
end;

end.

