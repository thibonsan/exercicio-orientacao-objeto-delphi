unit Regra.Interfaces;

interface

uses
  System.SysUtils,
  System.Classes;

type
  iRegrasOperacoes = interface;
  iRegrasParametros = interface;


  iRegrasController = interface
    ['{80B6D4E5-9DD9-4258-8BB9-8AB59E2BD4F3}']
    function Registry ( aKey : Integer; aValue : String ) : iRegrasController;
    function ListaRegras (aValue : TStrings ) : iRegrasController;
  end;

  iRegras = interface
    ['{6FD09D16-7D20-4200-90C7-25713C3F335D}']
    function Parametros : iRegrasParametros;
    function Operacoes : iRegrasOperacoes;
  end;

  iRegrasParametros = interface
    ['{AD62576F-DE14-4532-A210-83BFFFC0D248}']
    function Name : String; overload;
    function Name ( aValue : String ) : iRegrasParametros; overload;
    function Display ( aValue : TProc<String> ) : iRegrasParametros; overload;
    function Display : TProc<String>; overload;
    function Percent : Currency; overload;
    function Percent ( aValue : Currency ) : iRegrasParametros; overload;
    function &End : iRegras;
  end;

  iRegrasOperacoes = interface
    ['{7CD6EAAB-A881-416B-BEA5-6D2128A2CDDC}']
    function CalcularPreco ( aValue : Currency ) : Currency; overload;
    function CalcularPreco ( aValue : String ) : Currency; overload;
  end;

implementation

end.

