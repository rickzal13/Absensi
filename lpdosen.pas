unit lpdosen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr, grimgctrl;

type
  TLprDosen = class(TForm)
    lap_dosen: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    QRHRule1: TQRHRule;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    Hari: TQRLabel;
    Tanggal: TQRLabel;
    QRBand4: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    C: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel11: TQRLabel;
    QRHRule2: TQRHRule;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRDBText8: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LprDosen: TLprDosen;

implementation

uses Unit12;

{$R *.dfm}

end.
