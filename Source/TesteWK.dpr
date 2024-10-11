program TesteWK;

uses
  Vcl.Forms,
  uFrmPedido in '..\View\uFrmPedido.pas' {FrmPedido},
  uIProduto in '..\Interface\uIProduto.pas',
  uProduto in '..\Model\uProduto.pas',
  uIPedido in '..\Interface\uIPedido.pas',
  uPedido in '..\Model\uPedido.pas',
  uAttribute in 'uAttribute.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPedido, FrmPedido);
  Application.Run;
end.
