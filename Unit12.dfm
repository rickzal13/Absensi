inherited dm: Tdm
  OldCreateOrder = True
  Height = 337
  Width = 806
  object Data_dosen: TDataSource
    DataSet = ADO_dosen
    Left = 32
    Top = 152
  end
  object ADO_dosen: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbdosen')
    Left = 32
    Top = 96
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=doww;Persist Security Info=True;Use' +
      'r ID=sa;Initial Catalog=absen;Data Source=DwiAcer-PC;Use Procedu' +
      're for Prepare=1;Auto Translate=True;Packet Size=4096;Workstatio' +
      'n ID=RICK_ZAL-PC;Use Encryption for Data=False;Tag with column c' +
      'ollation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 144
    Top = 24
  end
  object Data_mhs: TDataSource
    DataSet = ADO_Mhs
    Left = 120
    Top = 160
  end
  object ADO_Mhs: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbmahasiswa')
    Left = 123
    Top = 95
  end
  object Data_umk: TDataSource
    DataSet = ADO_umk
    Left = 208
    Top = 160
  end
  object ADO_umk: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbmatakuliah')
    Left = 200
    Top = 96
  end
  object ADO_user: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbuser')
    Left = 280
    Top = 96
  end
  object Data_user: TDataSource
    DataSet = ADO_user
    Left = 280
    Top = 160
  end
  object ADO_jadwal: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbjadwal')
    Left = 352
    Top = 96
  end
  object Data_jadwal: TDataSource
    DataSet = ADO_jadwal
    Left = 352
    Top = 160
  end
  object ADO_kelas: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbkelas')
    Left = 424
    Top = 96
  end
  object Data_kelas: TDataSource
    DataSet = ADO_kelas
    Left = 424
    Top = 160
  end
  object ADO_absen: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbabsensi')
    Left = 488
    Top = 96
  end
  object Data_absen: TDataSource
    DataSet = ADOQuery1
    Left = 496
    Top = 160
  end
  object ADO_lap: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from lap')
    Left = 704
    Top = 160
  end
  object ADO_tes: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbabsensi')
    Left = 608
    Top = 96
  end
  object ADO_cek: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbabsensi')
    Left = 672
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbabsensi')
    Left = 576
    Top = 168
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from view_1')
    Left = 640
    Top = 168
  end
  object ADO_tes_lgi: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbabsensi_dosen')
    Left = 32
    Top = 208
  end
  object ADO_absen_dosen: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbabsensi_dosen')
    Left = 32
    Top = 272
  end
  object Data_absen_dosen: TDataSource
    DataSet = ADO_absen_dosen
    Left = 144
    Top = 272
  end
  object ADO_lap_dosen: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from lap_dosen')
    Left = 264
    Top = 264
  end
  object ADO_SP: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from View_4')
    Left = 344
    Top = 264
  end
  object ADO_sp1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tbabsensi')
    Left = 408
    Top = 232
  end
end
