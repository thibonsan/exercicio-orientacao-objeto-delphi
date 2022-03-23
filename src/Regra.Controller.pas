unit Regra.Controller;

interface

uses
  Regra.Interfaces,
  System.Generics.Collections,
  System.Classes;

type
  TRegraController = class(TInterfacedObject, iRegrasController)
    private
      FListRegras : TDictionary<Integer, String>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iRegrasController;
      function Registry ( aKey : Integer; aValue : String ) : iRegrasController;
      function ListaRegras (aValue : TStrings ) : iRegrasController;
 end;

var
  RegraController : iRegrasController;

implementation

{ TRegraController }

constructor TRegraController.Create;
begin
  FListRegras := TDictionary<Integer, String>.Create;
end;

destructor TRegraController.Destroy;
begin
  FListRegras.Free;
  inherited;
end;

function TRegraController.ListaRegras(aValue: TStrings): iRegrasController;
var
  KeysArray : TArray<Integer>;
  I: Integer;
begin
  aValue.Clear;
  KeysArray := FListRegras.Keys.ToArray;
  TArray.Sort<Integer>(KeysArray);
  for I in KeysArray do
    aValue.Add(FListRegras.Items[I]);
end;

class function TRegraController.New: iRegrasController;
begin
  if not Assigned(RegraController) then
    RegraController := Self.Create;

  Result := RegraController;
end;

function TRegraController.Registry(aKey: Integer;
  aValue: String): iRegrasController;
begin
  Result := Self;
  FListRegras.Add(aKey, aValue);
end;

end.

