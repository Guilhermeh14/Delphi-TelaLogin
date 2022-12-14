unit UntLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmlogin = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Edtlogin: TEdit;
    Edtsenha: TEdit;
    btnlogin: TBitBtn;
    btnlimpar: TBitBtn;
    Conexao: TFDConnection;
    qrylogin: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryloginUsuario: TStringField;
    qryloginSenha: TStringField;
    procedure btnlimparClick(Sender: TObject);
    procedure btnloginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmlogin: TFrmlogin;

implementation

{$R *.dfm}

uses Uprincipal;

procedure TFrmlogin.btnlimparClick(Sender: TObject);
begin
  Edtlogin.Clear;
  Edtsenha.Clear;
  Edtlogin.SetFocus;
end;

procedure TFrmlogin.btnloginClick(Sender: TObject);
var vSQL: string;
begin
  vSQL := '';
  vSQL := ' SELECT * FROM LOGIN ' +
          '  WHERE USUARIO = '+ QuotedStr(Edtlogin.Text)+
          '   AND SENHA = ' + QuotedStr(Edtsenha.Text);

  qrylogin.Close;
  qrylogin.SQL.CommaText := vSQL;
  qrylogin.Open;

  if qrylogin.IsEmpty then
    Application.MessageBox('Usuario ou Senha invalidos','Aten??o',
    MB_ICONINFORMATION + MB_OK)
  else
  begin
   frmprincipal.Show;
   Frmlogin.Hide;
  end;




end;

end.
