unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, qrpctrls, grimgctrl, jpeg, QuickRpt, ExtCtrls;

type
  TFsp = class(TForm)
    lap_sp: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    QRHRule1: TQRHRule;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRHRule2: TQRHRule;
    QRBand2: TQRBand;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    C: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    Hari: TQRLabel;
    Tanggal: TQRLabel;
    QRBand4: TQRBand;
    QRShape12: TQRShape;
    QRShape11: TQRShape;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fsp: TFsp;

implementation

uses Unit12;

{$R *.dfm}

end.
