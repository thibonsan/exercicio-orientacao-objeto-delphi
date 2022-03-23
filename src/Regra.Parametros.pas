unit Regra.Parametros;

interface

uses
  Regra.Interfaces,
  System.SysUtils;

type
  TRegraParametros = class(TInterfacedObject, iRegrasParametros)
    private
      [weak]
      FParent : iRegras;
      FName : String;
      FDisplay : TProc<String>;
      FPercent : Currency;
    public
      constructor Create(aParent : iRegras);
      destructor Destroy; override;
      class function New(aParent : iRegras) : iRegrasParametros;
      function Name : String; overload;
      function Name ( aValue : String ) : iRegrasParametros; overload;
      function Display ( aValue : TProc<String> ) : iRegrasParametros; overload;
      function Display : TProc<String>; overload;
      function Percent : Currency; overload;
      function Percent ( aValue : Currency ) : iRegrasParametros; overload;
      function &End : iRegras;
  end;

implementation

{ TRegraParametros }

function TRegraParametros.&End: iRegras;
begin
  Result := FParent;
end;

constructor TRegraParametros.Create(aParent: iRegras);
begin
  FParent := aParent;
end;

destructor TRegraParametros.Destroy;
begin

  inherited;
end;

function TRegraParametros.Display(aValue: TProc<String>): iRegrasParametros;
begin
  Result := Self;
  FDisplay := aValue;
end;

function TRegraParametros.Display: TProc<String>;
begin
  Result := FDisplay;
end;

function TRegraParametros.Name: String;
begin
  Result := FName;
end;

function TRegraParametros.Name(aValue: String): iRegrasParametros;
begin
  Result := Self;
  FName := aValue;
end;

class function TRegraParametros.New(aParent: iRegras): iRegrasParametros;
begin
  Result := Self.Create(aParent);
end;

function TRegraParametros.Percent: Currency;
begin
  Result := FPercent;
end;

function TRegraParametros.Percent(aValue: Currency): iRegrasParametros;
begin
  Result := Self;
  FPercent := aValue;
end;

end.

