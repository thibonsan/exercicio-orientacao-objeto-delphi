unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Regra.Interfaces;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    FRegra : iRegras;
    procedure ExibirResultado ( aValue : String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Regra.Tipo, Regra.Controller;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FRegra.Operacoes.CalcularPreco(Edit1.Text);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  FRegra :=
    TEnumRegras(ComboBox1.ItemIndex)
      .this
      .Parametros
        .Display(ExibirResultado)
      .&End;
end;

procedure TForm1.ExibirResultado(aValue: String);
begin
  Memo1.Lines.Add(aValue);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  TRegraController.New.ListaRegras(ComboBox1.Items);
end;

end.
