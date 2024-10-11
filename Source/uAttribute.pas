unit uAttribute;

interface

type
  DisplayLabel = class(TCustomAttribute)
  private
    FName: String;
    FSize: integer;
    FVisible: Boolean;
  public
    constructor Create(aName: String; aVisible: Boolean = true; aSize: Integer = 0);
    property Name: String read FName write FName;
    property Size: integer read FSize write FSize;
    property Visible: Boolean read FVisible write FVisible;
  end;

implementation

constructor DisplayLabel.Create(aName: String; aVisible: Boolean; aSize: Integer);
begin
  FName := aName;
  FSize := aSize;
  FVisible := aVisible;
end;


end.
