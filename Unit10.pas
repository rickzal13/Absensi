unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls;

type
  Tkehadiran = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Timer1: TTimer;
    Label11: TLabel;
    Label12: TLabel;
    Timer2: TTimer;
    Label1: TLabel;
    txt_nim: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kehadiran: Tkehadiran;

implementation

uses Dabsensi;

{$R *.dfm}

procedure Tkehadiran.Timer1Timer(Sender: TObject);
begin
  close;
end;

end.
