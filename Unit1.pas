unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RibbonLunaStyleActnCtrls, Ribbon, ToolWin, ActnMan, ActnCtrls,
  ActnMenus, RibbonActnMenus, ActnList, ExtCtrls, pngimage, ComCtrls,
  RibbonObsidianStyleActnCtrls;

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
    Image2: TImage;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    RibbonGroup6: TRibbonGroup;
    MonthCalendar1: TMonthCalendar;
    Image6: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    RibbonGroup7: TRibbonGroup;
    Image3: TImage;
    Image7: TImage;
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
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  MonthCalendar1.Left := -250;
   Timer1.Enabled:=true;
end;

procedure TForm1.Image10Click(Sender: TObject);
begin
form8.show;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
form3.show;
end;


procedure TForm1.Image3Click(Sender: TObject);
begin
form5.show;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
form4.Show;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
Form6.show;
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
  if MonthCalendar1.Left <= -250 then
    begin
      timer1.Enabled:=true;
      timer2.Enabled:=false;
    end
  else if MonthCalendar1.Left >=25 then
    begin
      timer2.Enabled:=true;
      timer1.Enabled:=false;
    end;
end;

procedure TForm1.Image7Click(Sender: TObject);
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
    MonthCalendar1.Left:= MonthCalendar1.Left + 5;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if MonthCalendar1.Left > -250 then
    MonthCalendar1.Left:= MonthCalendar1.Left - 10
end;

end.
