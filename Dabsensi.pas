unit Dabsensi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ImgList, OoMisc, AdPort,
  pngimage, ADODB;

type
  TForm11 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    txt_nim: TEdit;
    txt_nama: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    txt_jurusan: TEdit;
    Label3: TLabel;
    txt_program: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    txt_kelas: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    radio_sakit: TRadioButton;
    radio_izin: TRadioButton;
    radio_alfa: TRadioButton;
    radio_hadir: TRadioButton;
    DBGrid1: TDBGrid;
    Image2: TImage;
    image: TImageList;
    Timer1: TTimer;
    Timer2: TTimer;
    ApdComPort1: TApdComPort;
    Timer3: TTimer;
    txt_id: TEdit;
    Timer4: TTimer;
    Edit1: TEdit;
    Label12: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    Timer5: TTimer;
    Label10: TLabel;
    Label11: TLabel;
    Image4: TImage;
    Label13: TLabel;
    Timer6: TTimer;
    Label14: TLabel;
    cmb_cari: TComboBox;
    txt_cari: TEdit;
    cmb_mk: TComboBox;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure ApdComPort1TriggerAvail(CP: TObject; Count: Word);
    procedure txt_kelasChange(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure txt_cariChange(Sender: TObject);
    procedure cmb_mkDropDown(Sender: TObject);
    procedure ApdComPort1PortOpen(Sender: TObject);
    procedure ApdComPort1PortClose(Sender: TObject);
    procedure cmb_mkChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Image4Click(Sender: TObject);
    procedure txt_idChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
    Port_State: boolean;
    thedata: string;
    procedure EnumComPorts(Ports: TStrings);
    procedure kopi;
    procedure simpan;
  public
    { Public declarations }
    procedure bersih;
    procedure aktif;
    procedure taktif;
    procedure tampil;
    procedure btnkonek;
    procedure segar;
    procedure segar_lgi;

  end;

var
  Form11: TForm11;
  xyz, p, id,e: integer;
  n, BAR, j, k, c, q, h, i: String;

implementation

uses Unit12, Unit10, Unit13, Umahasiswa, Udosen, Dosen, Laporan;
{$R *.dfm}
{ TForm11 }

procedure TForm11.aktif;
begin
  // cmb_mk.Enabled := true;
  txt_id.Enabled := true;
  txt_nim.Enabled := true;
  txt_nama.Enabled := true;
  txt_jurusan.Enabled := true;
  txt_program.Enabled := true;
  txt_kelas.Enabled := true;
  // cmb_mk.Enabled := true;
end;

procedure TForm11.ApdComPort1PortClose(Sender: TObject);
begin
  Port_State := true;
  Form13.Button1.Caption := 'disConnected';
end;

procedure TForm11.ApdComPort1PortOpen(Sender: TObject);
begin
  Port_State := true;
  Form13.Button1.Caption := 'Connected';
end;

procedure TForm11.ApdComPort1TriggerAvail(CP: TObject; Count: Word);
var
  thechar: String;
  // buffer1:string;
  i: integer;
  a: integer;
begin
  // Memo1.Clear;

  n := '';
  for i := Count downto 1 do
  begin

    thechar := ApdComPort1.GetChar;
    thedata := thedata + thechar;

    if thechar = chr(10) then
    begin
      if trim(thedata) <> '' then
      begin
        // txt_id.Clear;
        // txt_id.Text := trim(thedata);
        a := length(thedata);
        a := a - 13;
        ULdosen.txt_kode.Text := trim(copy(thedata, a, 12));
        txt_id.Text := trim(copy(thedata, a, 12));
        form2.txtidcard.Text := trim(copy(thedata, a, 12));
        Ddosen.txt_kartu.Text := trim(copy(thedata, a, 12));
        // if (trim(txt_id.Text) <> '') then
        if Form11.Active = true then
          tampil;
        if ULdosen.Active = true then
          ULdosen.tampil;
        // edit1.Clear;
        // Memo1.Lines.Add(trim(thedata));
        // n := n + trim(txt_id.Text);

      end;
    end;
  end;

end;

procedure TForm11.bersih;
begin
  txt_id.Clear;
  txt_nim.Clear;
  txt_nama.Clear;
  txt_jurusan.Clear;
  txt_program.Clear;
  txt_kelas.Clear;
  // cmb_mk.Clear;
  radio_hadir.Checked := false;
end;

procedure TForm11.btnkonek;
var
  ComNo: string;
begin
  if Form13.ComboBox1.ItemIndex = -1 then
  begin
    MessageBox(Handle, 'Tolong hubungkan alat RFIDnya', pchar(Application.Title)
        , MB_OK or MB_ICONERROR);
    exit;
  end;
  ComNo := copy(Form13.ComboBox1.Text, 4, length(Form13.ComboBox1.Text) - 1);
  if not Port_State then
  begin
    with ApdComPort1 do
    begin
      Baud := StrToInt(Form13.ComboBox2.Text);
      ComNumber := StrToInt(ComNo);
      try
        Open := true;
      Except
        MessageBox(Handle, 'Can not open COM', pchar(Application.Title),
          MB_OK or MB_ICONERROR);
        exit;
      end;
    end;
  end
  else
  begin
    ApdComPort1.Open := false;
  end;
  Timer3.Enabled := true;

end;

procedure TForm11.Button2Click(Sender: TObject);
var
  ComNo: string;
begin
  if Form13.ComboBox1.ItemIndex = -1 then
  begin
    MessageBox(Handle, 'Please select a com', pchar(Application.Title),
      MB_OK or MB_ICONERROR);
    exit;
  end;
  ComNo := copy(Form13.ComboBox1.Text, 4, length(Form13.ComboBox1.Text) - 1);
  if not Port_State then
  begin
    with ApdComPort1 do
    begin
      Baud := StrToInt(Form13.ComboBox2.Text);
      ComNumber := StrToInt(ComNo);
      try
        Open := true;
      Except
        MessageBox(Handle, 'Can not open COM', pchar(Application.Title),
          MB_OK or MB_ICONERROR);
        exit;
      end;
    end;
  end
  else
  begin
    ApdComPort1.Open := false;
  end;
  Timer3.Enabled := true;

end;

procedure TForm11.Button3Click(Sender: TObject);
begin
  ApdComPort1.Open := false;
end;

procedure TForm11.cmb_mkChange(Sender: TObject);
begin
  { with dm.ADO_tes do
    begin
    q := cmb_mk.Text;
    SQL.Add('INSERT INTO tbabsensi (idcard,Tanggal,nim, nama, jurusan, program_studi, kelas,mata_kuliah, alfa) SELECT idcard,'+QuotedStr(Label14.Caption)+',nim, nama, jurusan, programstudi,kelas,'+QuotedStr(q)+',2 AS Expr1 FROM tbmahasiswa');
    ExecSQL;
    Application.MessageBox('sukses tersimpan', 'pesan', MB_ICONINFORMATION);
    end; }
end;

procedure TForm11.cmb_mkDropDown(Sender: TObject);
begin
  cmb_mk.Clear;
  with dm.ADO_jadwal do
  begin
    SQL.Clear;
    SQL.Add('select * from tbjadwal');
    Open;
    while not Eof do
    begin
      cmb_mk.Items.Add(FieldByName('matakuliah').Value);
      Next;
    end;
  end;
end;

procedure TForm11.ComboBox1DropDown(Sender: TObject);
begin
  EnumComPorts(Form13.ComboBox1.Items);
end;

procedure TForm11.DBGrid1CellClick(Column: TColumn);
begin
  with dm.ADOQuery1 do
  begin
    txt_id.Text := FieldValues['idcard'];
    txt_nim.Text := FieldValues['nim'];
    txt_nama.Text := FieldValues['nama'];
    txt_jurusan.Text := FieldValues['jurusan'];
    txt_program.Text := FieldValues['program_studi'];
    txt_kelas.Text := FieldValues['kelas'];
  end;
end;

procedure TForm11.txt_kelasChange(Sender: TObject);
begin
  // if dm.ADO_umk.Locate('Kode_matakuliah', txt_kelas.Text, []) then
  // Begin
  // With dm.ADO_umk do
  // Begin
  // txt_matakuliah.Text := FieldValues['matakuliah'];
  // End;
  // End;
end;

procedure TForm11.txt_cariChange(Sender: TObject);
begin
  if cmb_cari.Text = 'NIM' then
  begin
    with dm.ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Text := ('select * from tbabsensi where nim like ' + QuotedStr
          ('%' + txt_cari.Text + '%'));
      Open;
      DBGrid1.DataSource := dm.Data_absen;
    end;
  end
  else if cmb_cari.Text = 'NAMA' then
  begin
    with dm.ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Text := ('select * from tbabsensi where nama like ' + QuotedStr
          ('%' + txt_cari.Text + '%'));
      Open;
      DBGrid1.DataSource := dm.Data_absen;
    end;
  end

  else if cmb_cari.Text = 'TANGGAL' then
  begin
    with dm.ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Text := ('select * from tbabsensi where Tanggal like ' + QuotedStr
          ('%' + txt_cari.Text + '%'));
      Open;
      DBGrid1.DataSource := dm.Data_absen;
    end;
  end
end;

procedure TForm11.txt_idChange(Sender: TObject);
begin
  // if Form11.Active = true then
  // tampil;

end;

procedure TForm11.EnumComPorts(Ports: TStrings);
var
  KeyHandle: HKEY;
  ErrCode, Index: integer;
  ValueName, Data: string;
  ValueLen, DataLen, ValueType: DWORD;
  TmpPorts: TStringList;
begin
  ErrCode := RegOpenKeyEx(HKEY_LOCAL_MACHINE, 'HARDWARE\DEVICEMAP\SERIALCOMM',
    0, KEY_READ, KeyHandle);

  if ErrCode <> ERROR_SUCCESS then
  begin
    // raise EComPortExt.Create('EnumComPorts',CError_RegError, ErrCode);
    MessageBox(Handle, 'Registry error!!! alat belum terpasang', pchar
        (Application.Title), MB_OK or MB_ICONERROR);
    exit;
  end;
  TmpPorts := TStringList.Create;
  try
    Index := 0;
    repeat
      ValueLen := 256;
      DataLen := 256;
      SetLength(ValueName, ValueLen);
      SetLength(Data, DataLen);
      ErrCode := RegEnumValue(KeyHandle, Index, pchar(ValueName),
{$IFDEF DELPHI_4_OR_HIGHER}
        Cardinal(ValueLen),
{$ELSE}
        ValueLen,
{$ENDIF}
        nil, @ValueType, PByte(pchar(Data)), @DataLen);

      if ErrCode = ERROR_SUCCESS then
      begin
        SetLength(Data, DataLen);
        TmpPorts.Add(Data);
        Inc(Index);
      end
      else if ErrCode <> ERROR_NO_MORE_ITEMS then
        MessageBox(Handle,
          'Registry error!!! Mungkin Modem belum Terpasang... ', pchar
            (Application.Title), MB_OK or MB_ICONERROR);

    until (ErrCode <> ERROR_SUCCESS);

    TmpPorts.Sort;
    Ports.Assign(TmpPorts);
  finally
    RegCloseKey(KeyHandle);
    TmpPorts.Free;
  end;

end;

procedure TForm11.FormActivate(Sender: TObject);
begin
  { with dm.ADO_absen do
    begin
    SQL.Add('select * from tbabsensi where Tanggal ='+QuotedStr(Label14.Caption)+'');
    ExecSQL;
    end; }
  //segar;
  //cmb_mk.Text := ULdosen.cmb_mka.Text;
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
  // xyz := 1;
  // EnumComPorts(form13.ComboBox1.Items);
  // if form13.ComboBox1.Items.Count > 0 then
  // form13.ComboBox1.ItemIndex := 0;
  // taktif;
  { with dm.ADO_absen do
    begin
    SQL.Add('select * from tbabsensi where Tanggal ='+QuotedStr(Label14.Caption)+'');
    ExecSQL;
    end; }
  bersih;
  taktif;

end;

procedure TForm11.Image1Click(Sender: TObject);
begin
  dm.ADOQuery2.close;
  dm.ADOQuery2.Open;
  Flaporan.lap_semua.preview;
end;

procedure TForm11.Image3Click(Sender: TObject);
begin
  close;
end;

procedure TForm11.Image4Click(Sender: TObject);
begin
  with dm.ADOQuery1 do
  begin
    Edit;
    if radio_sakit.Checked then
    begin
      FieldByName('alfa').Value := 0;
      FieldByName('izin').Value := 0;
      FieldByName('hadir').Value := 0;
      FieldByName('sakit').Value := 1;
    end
    else if radio_izin.Checked then
    begin
      FieldByName('alfa').Value := 0;
      FieldByName('sakit').Value := 0;
      FieldByName('hadir').Value := 0;
      FieldByName('izin').Value := 1;
    end;
    post;
    bersih;
  end;

end;

procedure TForm11.kopi;
begin

end;

procedure TForm11.segar;
begin
  with dm.ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('select * from tbabsensi where Tanggal = ' + QuotedStr
        (Label14.Caption));
    Open;
  end
end;

procedure TForm11.segar_lgi;
begin
  with dm.ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('select * from tbabsensi');
    Open;
  end
end;

procedure TForm11.simpan;
begin
  if dm.ADO_umk.Locate('matakuliah', cmb_mk.Text, []) then
    with dm.ADO_umk do
    begin
      j := FieldValues['waktu'];
      with dm.ADO_absen do
      // if (dm.ADO_absen.Locate('Tanggal', Label8.Caption, [])) and (dm.ADO_absen.Locate('nama', txt_nama.Text, [])) then
      // if (dm.ADO_absen.Locate('nama', txt_nama.Text,[])) then
      begin

        if StrToTime(Label13.Caption) > StrToTime(j) + StrToTime('00:20:00')
          then
        begin
          // FieldByName('alfa').Value := 4;
          // SQL.Clear;
          SQL.Text := (
            'update tbabsensi set alfa = 4,hadir=0,izin=0,sakit=0 where nama = '
              + QuotedStr(txt_nama.Text) + 'and mata_kuliah = ' + QuotedStr
              (cmb_mk.Text) + 'and Tanggal = ' + QuotedStr(Label14.Caption));
          ExecSQL;
          // Application.MessageBox('sukses tersimpan', 'pesan', MB_ICONINFORMATION);
        end
        else
        begin
          // sql.Clear;
          // SQL.Clear;
          SQL.Text := (
            'UPDATE tbabsensi set alfa = 0,hadir=1,izin=0,sakit=0 where nama = '
              + QuotedStr(txt_nama.Text) + 'and mata_kuliah = ' + QuotedStr
              (cmb_mk.Text) + 'and Tanggal = ' + QuotedStr(Label14.Caption));
          ExecSQL;
        end;
        SQL.Text := ('select * from tbabsensi');
        Open;
        //segar_lgi;

      end;

    end;
  bersih;
  taktif;
end;

procedure TForm11.taktif;
begin
  // cmb_mk.Enabled := false;
  txt_id.Enabled := false;
  txt_nim.Enabled := false;
  txt_nama.Enabled := false;
  txt_jurusan.Enabled := false;
  txt_program.Enabled := false;
  txt_kelas.Enabled := false;
end;

procedure TForm11.tampil;
begin
with dm.ADO_absen do
begin
    SQL.Clear;
    SQL.Add('select * from tbabsensi');
    Open;
  if dm.ADO_absen.Locate('idcard', txt_id.Text, []) then
  Begin
    With dm.ADO_absen do
    Begin
      txt_nim.Text := FieldValues['nim'];
      txt_nama.Text := FieldValues['nama'];
      txt_jurusan.Text := FieldValues['jurusan'];
      txt_program.Text := FieldValues['program_studi'];
      txt_kelas.Text := FieldValues['kelas'];
    End;
    radio_hadir.Checked := true;
    Timer5.Enabled := true;
    Timer4.Enabled := true;
  End
  else
  Begin
    Application.MessageBox('Maaf.. Anda tidak terdaftar', 'pesan',
      MB_ICONINFORMATION);
  End;
end;
end;

procedure TForm11.Timer3Timer(Sender: TObject);
begin
  if not Port_State then
    exit;

  // xyz:=3;

  if xyz = 1 then
    ApdComPort1.Output := ('at+csq' + #13)
  else if xyz = 2 then
    ApdComPort1.Output := ('at+cgmi' + #13)
  else if xyz = 3 then
    ApdComPort1.Output := ('at+cgmm' + #13)
  else if xyz = 4 then
    ApdComPort1.Output := ('at+cgsn' + #13);

end;

procedure TForm11.Timer4Timer(Sender: TObject);
begin
  simpan;
  // edit1.Clear;
  kehadiran.Show;
  Timer4.Enabled := false;
end;

procedure TForm11.Timer5Timer(Sender: TObject);
begin
  kehadiran.txt_nim.Caption := txt_nim.Text;
  kehadiran.Label7.Caption := txt_nama.Text;
  kehadiran.Label8.Caption := txt_jurusan.Text;
  kehadiran.Label9.Caption := txt_program.Text;
  kehadiran.Label10.Caption := txt_kelas.Text;
  kehadiran.Label12.Caption := 'HADIR';
  Timer5.Enabled := false;

end;

procedure TForm11.Timer6Timer(Sender: TObject);
begin
  Label13.Caption := TimeToStr(Time);
  Label14.Caption := DateToStr(Date);
  Label15.Caption := formatdatetime('dddd', now());
   if Label15.Caption = 'Sunday' then
    i := 'MINGGU'
    else if Label15.Caption = 'Monday' then
    i := 'SENIN'
    else if Label15.Caption = 'Tuesday' then
    i := 'SELASA'
    else if Label15.Caption = 'Wednesday' then
    i := 'RABU'
    else if Label15.Caption = 'Thursday' then
    i := 'KAMIS'
    else if Label15.Caption = 'Friday' then
    i := 'JUMAT'
    else if Label15.Caption = 'Saturday' then
    i := 'SABTU';

  {  if dm.ADO_umk.RecordCount <> 0 then
    begin
      with dm.ADO_umk do
      begin
        j := FieldValues['waktu'];
        h := FieldValues['hari'];
        if ((i = h) and (StrToTime(Label13.Caption) = StrToTime(j))) then
        begin
          cmb_mk.Text := FieldValues['matakuliah'];
          segar_lgi;
        {  with dm.ADO_tes do
          begin
            q := cmb_mk.Text;
            SQL.Add(
              'INSERT INTO tbabsensi (idcard,Tanggal,nim, nama, jurusan, program_studi, kelas,mata_kuliah, alfa,sakit,izin,hadir) SELECT idcard,' + QuotedStr(Label14.Caption) + ',nim, nama, jurusan, programstudi,kelas,' + QuotedStr(q) + ',2,0,0,0 AS Expr1 FROM tbmahasiswa');
            ExecSQL;
            Application.MessageBox('sukses tersimpan', 'pesan',
              MB_ICONINFORMATION);
            Open;
            segar_lgi;
          end;

        end

      end;

  end;
  }
end;

end.
