unit uIProduto;

interface

type
  IProduto = Interface
    ['{8398E8B1-2842-45DA-8C90-9A4F3AFEEAF6}']
    function GetNome: string;
    function GetPreco: Extended;
    procedure AplicarDesconto(APercDesconto: Extended);
  End;

implementation

end.
