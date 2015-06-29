unit frmutama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RibbonLunaStyleActnCtrls, Ribbon, ToolWin, ActnMan, ActnCtrls,
  ActnMenus, RibbonActnMenus, ActnList, ExtCtrls, pngimage, ComCtrls,
  RibbonObsidianStyleActnCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Ribbon1: TRibbon;
    RibbonPage1: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonPage2: TRibbonPage;
    ActionManager1: TActionManager;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    RibbonPage3: TRibbonPage;
    RibbonGroup3: TRibbonGroup;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup5: TRibbonGroup;
    tblogin: TImage;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    RibbonGroup6: TRibbonGroup;
    MonthCalendar1: TMonthCalendar;
    Image6: TImage;
    Timer1: TTimer;
    RibbonGroup7: TRibbonGroup;
    tbedituser: TImage;
    tbkeluar: TImage;
    Image8: TImage;
    RibbonGroup8: TRibbonGroup;
    RibbonPage4: TRibbonPage;
    RibbonGroup9: TRibbonGroup;
    RibbonGroup10: TRibbonGroup;
    RibbonGroup11: TRibbonGroup;
    RibbonGroup12: TRibbonGroup;
    Image9: TImage;
    Image10: TImage;
    RibbonGroup13: TRibbonGroup;
    RibbonGroup14: TRibbonGroup;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    StatusBar1: TStatusBar;
    RibbonPage5: TRibbonPage;
    RibbonGroup15: TRibbonGroup;
    Image2: TImage;
    RibbonPage6: TRibbonPage;
    RibbonGroup16: TRibbonGroup;
    Image7: TImage;
    RibbonPage7: TRibbonPage;
    RibbonGroup17: TRibbonGroup;
    Image15: TImage;
    Image3: TImage;
    RibbonGroup18: TRibbonGroup;
    Image17: TImage;
    GroupBox1: TGroupBox;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image18: TImage;
    RibbonGroup20: TRibbonGroup;
    Image22: TImage;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    RibbonGroup19: TRibbonGroup;
    Image16: TImage;
    RibbonGroup21: TRibbonGroup;
    Image23: TImage;
    procedure Image1Click(Sender: TObject);
    procedure tbloginClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure tbkeluarClick(Sender: TObject);
    procedure tbedituserClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image18MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image18MouseLeave(Sender: TObject);
    procedure Image19MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image19MouseLeave(Sender: TObject);
    procedure Image20MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image20MouseLeave(Sender: TObject);
    procedure Image21MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image21MouseLeave(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure Image23Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Umahasiswa, Uedituser, Ulogin, Udosen, Ukelas, Umk, Ujadwal, Dabsensi,
  Ldosen, Lmahasiswa, Lkelas, Ljadwal, Lmk, Unit13, laporan, Unit14,dosen,lpdosen,
  Unit12, Unit15, Tmahasiswa, Unit16;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  MonthCalendar1.Left := -250;
  Timer1.Enabled := true;

  RibbonPage1.Enabled := false;
  RibbonPage2.Enabled := false;
  RibbonPage3.Enabled := false;
  RibbonPage4.Enabled := false;

end;

procedure TForm1.Image10Click(Sender: TObject);
begin
  // form11.Timer6.Enabled := false;
  form8.show;

end;

procedure TForm1.Image11Click(Sender: TObject);
begin
  fdosen.show;
end;

procedure TForm1.Image12Click(Sender: TObject);
begin
  Fkelas.show;
end;

procedure TForm1.Image13Click(Sender: TObject);
begin
  Fjadwal.show;
end;

procedure TForm1.Image14Click(Sender: TObject);
begin
  fmk.show;
end;

procedure TForm1.Image15Click(Sender: TObject);
begin
  form14.show;
end;

procedure TForm1.Image16Click(Sender: TObject);
begin
  dm.ADO_lap_dosen.Close;
  dm.ADO_lap_dosen.Open;
  LprDosen.lap_dosen.Preview;
end;

procedure TForm1.Image17Click(Sender: TObject);
begin
Uldosen.Show;
end;

procedure TForm1.Image18MouseLeave(Sender: TObject);
begin
  image18.Top:=33;
end;

procedure TForm1.Image18MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  image18.Top:=30;
end;

procedure TForm1.Image19MouseLeave(Sender: TObject);
begin
  image19.Top:=33;
end;

procedure TForm1.Image19MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  image19.Top:=30;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  form2.show;
end;

procedure TForm1.Image20MouseLeave(Sender: TObject);
begin
  image20.Top:=33;
end;

procedure TForm1.Image20MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  image20.Top:=30;
end;

procedure TForm1.Image21MouseLeave(Sender: TObject);
begin
  image21.Top:=33;
end;

procedure TForm1.Image21MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  image21.Top:=30;
end;

procedure TForm1.Image22Click(Sender: TObject);
begin
dm.ADO_SP.Close;
dm.ADO_SP.Open;
Fsp.lap_sp.preview;
end;

procedure TForm1.Image23Click(Sender: TObject);
begin
Form16.show;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  // form11.Timer6.Enabled := true;
  Form11.show;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
  dm.ADOQuery2.close;
  dm.ADOQuery2.Open;
  Flaporan.lap_semua.preview;
end;

procedure TForm1.tbloginClick(Sender: TObject);
begin
  form3.show;
  RibbonPage1.Enabled := false;
  RibbonPage2.Enabled := false;
  RibbonPage3.Enabled := false;
  RibbonPage4.Enabled := false;
  StatusBar1.Panels.Items[0].Text := 'USER : ';
end;

procedure TForm1.tbedituserClick(Sender: TObject);
begin
  form5.show;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
  Ddosen.show;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
  Form6.show;
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
  if MonthCalendar1.Left <= -250 then
  begin
    Timer1.Enabled := true;
    Timer2.Enabled := false;
  end
  else if MonthCalendar1.Left >= 25 then
  begin
    Timer2.Enabled := true;
    Timer1.Enabled := false;
  end;
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
  Form13.show;
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
  Fmahasiswa.show;
  //Flmahasiswa.show;
end;

procedure TForm1.tbkeluarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
  form7.show;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if MonthCalendar1.Left < 25 then
    MonthCalendar1.Left := MonthCalendar1.Left + 5;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if MonthCalendar1.Left > -250 then
    MonthCalendar1.Left := MonthCalendar1.Left - 10
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  form3.show;
  Timer3.Enabled := false;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[1].Text := 'JAM : ' + TimeToStr(time);
  StatusBar1.Panels.Items[2].Text := 'TANGGAL : ' + DateToStr(date);
  i := formatdatetime('dddd', now());
  if i = 'Sunday' then
    StatusBar1.Panels.Items[3].Text := 'HARI : '+ 'MINGGU'
  else if i = 'Monday' then
    StatusBar1.Panels.Items[3].Text := 'HARI : '+ 'SENIN'
  else if i = 'Tuesday' then
    StatusBar1.Panels.Items[3].Text := 'HARI : '+ 'SELASA'
  else if i = 'Wednesday' then
    StatusBar1.Panels.Items[3].Text := 'HARI : '+ 'RABU'
  else if i = 'Thursday' then
    StatusBar1.Panels.Items[3].Text := 'HARI : '+ 'KAMIS'
  else if i = 'Friday' then
    StatusBar1.Panels.Items[3].Text := 'HARI : '+ 'JUMAT'
  else if i = 'Saturday' then
    StatusBar1.Panels.Items[3].Text := 'HARI : '+ 'SABTU';
end;

end.
