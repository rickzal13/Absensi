program Abensi;

uses
  Forms,
  frmutama in 'frmutama.pas' {Form1},
  Umahasiswa in 'Umahasiswa.pas' {Form2},
  Ulogin in 'Ulogin.pas' {Form3},
  Udosen in 'Udosen.pas' {Ddosen},
  Uedituser in 'Uedituser.pas' {Form5},
  Ukelas in 'Ukelas.pas' {Form6},
  Ujadwal in 'Ujadwal.pas' {Form7},
  Umk in 'Umk.pas' {Form8},
  Unit9 in 'Unit9.pas' {DataModule9: TDataModule},
  Ldosen in 'Ldosen.pas' {Fdosen},
  Dabsensi in 'Dabsensi.pas' {Form11},
  Unit12 in 'Unit12.pas' {dm: TDataModule},
  Lmahasiswa in 'Lmahasiswa.pas' {Fmahasiswa},
  Lkelas in 'Lkelas.pas' {Fkelas},
  Ljadwal in 'Ljadwal.pas' {Fjadwal},
  Lmk in 'Lmk.pas' {Fmk},
  Unit10 in 'Unit10.pas' {kehadiran},
  Unit13 in 'Unit13.pas' {Form13},
  Laporan in 'Laporan.pas' {Flaporan},
  Unit14 in 'Unit14.pas' {Form14},
  Dosen in 'Dosen.pas' {ULdosen},
  lpdosen in 'lpdosen.pas' {LprDosen},
  tdosen in 'tdosen.pas' {hdosen},
  Tmahasiswa in 'Tmahasiswa.pas' {flmahasiswa},
  Unit15 in 'Unit15.pas' {Fsp},
  Unit16 in 'Unit16.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TDdosen, Ddosen);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TDataModule9, DataModule9);
  Application.CreateForm(TFdosen, Fdosen);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFmahasiswa, Fmahasiswa);
  Application.CreateForm(TFkelas, Fkelas);
  Application.CreateForm(TFjadwal, Fjadwal);
  Application.CreateForm(TFmk, Fmk);
  Application.CreateForm(Tkehadiran, kehadiran);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TFlaporan, Flaporan);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TULdosen, ULdosen);
  Application.CreateForm(TLprDosen, LprDosen);
  Application.CreateForm(Thdosen, hdosen);
  Application.CreateForm(Tflmahasiswa, flmahasiswa);
  Application.CreateForm(TFsp, Fsp);
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
