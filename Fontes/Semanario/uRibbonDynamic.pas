{ Unit: wzm.br.Util.Ribbon                                                     }
{ Author: William Zonta                                                        }
{ License: GNU ==> http://www.gnu.org/                                         }
{ Date: 2011-01                                                                }
{ E-mail: williamzontamendonca@gmail.com                                       }
{ Website: http://www.wzmsoftware.com.br/                                      }

unit uRibbonDynamic;

interface

uses Classes, ImgList, Forms, Graphics, SysUtils, Ribbon, RibbonStyleActnCtrls,
  RibbonActnMenus, ActnMan, ActnList;

{$REGION 'ActionManager'}

  function AddActionManager(AStyle: TActionBarStyle;
    AImages: TCustomImageList = nil; ALargeImages: TCustomImageList = nil;
    ALargeDisabledImages: TCustomImageList = nil): TActionManager;

  function AddActionBarItem(AActionManager: TActionManager): TActionBarItem;

  function AddAction(AActionManager: TActionManager; AOnExecute: TNotifyEvent;
    AName, ACaption: String; ACategory: String = '';
    ATag: Integer = 0; AImageIndex: Integer = -1;
    AKeyTip: String = ''): TAction;

{$ENDREGION}

{$REGION 'Ribbon'}

  function AddRibbon(Sender: TForm; ACaption: String; AVisible: Boolean = True;
    AShowHelpButton: Boolean = False): TRibbon;

  function AddPage(ARibbon: TRibbon; ACaption: String;
    AKeyTip: String = ''): TCustomRibbonPage;
  function LocatePage(ARibbon: TRibbon; ACaption: String): TCustomRibbonPage;

  function AddGroup(APage: TCustomRibbonPage; AActionManager: TActionManager;
    ACaption: String; AKeyTip: String = ''; ARows: Integer = 3;
    AGroupAlign: Integer = 0): TRibbonGroup;
  function LocateGroup(APage: TCustomRibbonPage;
    ACaption: String): TRibbonGroup;

  procedure AddItem(AActionBegin, AActionEnd: Integer;
    ARibbonGroup: TRibbonGroup; AActionManager: TActionManager;
    ACommandStyle: Integer = 0; AButtonSize: Integer = 0;
    AButtonType: Integer = 0);

  procedure AddApplicationMenu(ARibbon: TRibbon; AActionManager: TActionManager);

  procedure AddRecentItem(ARibbon: TRibbon; AFileName: String);

{$ENDREGION}

implementation

function AddActionManager(AStyle: TActionBarStyle; AImages, ALargeImages,
  ALargeDisabledImages: TCustomImageList): TActionManager;
begin
  Result := TActionManager.Create(Application);
  //Define o estilo do componente: RibbonLunaStyle, RibbonObsidianStyle, RibbonSilverStyle
  Result.Style := AStyle;
  if AImages <> nil then
    Result.Images := AImages;
  if ALargeImages <> nil then
    Result.LargeImages := ALargeImages;
  if ALargeDisabledImages <> nil then
    Result.LargeDisabledImages := ALargeDisabledImages;
end;

function AddActionBarItem(AActionManager: TActionManager): TActionBarItem;
begin
  Result := AActionManager.ActionBars.Add;
end;

function AddAction(AActionManager: TActionManager; AOnExecute: TNotifyEvent;
  AName, ACaption, ACategory: String; ATag, AImageIndex: Integer;
  AKeyTip: String): TAction;
begin
  Result := TAction.Create(Application);
  Result.Name := AName;
  Result.Tag := ATag;
  Result.Caption := ACaption;
  Result.Category := ACategory;
  Result.ImageIndex := AImageIndex;
  Result.OnExecute := AOnExecute;
  Result.ActionList := AActionManager;
  Result.Hint := AKeyTip;
end;

function AddRibbon(Sender: TForm; ACaption: String; AVisible,
  AShowHelpButton: Boolean): TRibbon;
begin
  Result := TRibbon.Create(Application);
  Result.Caption := ACaption;
  Result.Visible := AVisible;
  Result.Parent := Sender;
  Result.ShowHelpButton := AShowHelpButton;
end;

function AddPage(ARibbon: TRibbon; ACaption,
  AKeyTip: String): TCustomRibbonPage;
begin
  with ARibbon.Tabs.Add do
  begin
    Caption := ACaption;
    KeyTip := AKeyTip;
  end;

  Result := ARibbon.Tabs[ARibbon.Tabs.Count - 1].Page;
end;

function LocatePage(ARibbon: TRibbon; ACaption: String): TCustomRibbonPage;
begin
  Result := ARibbon.Tabs.GetPageFromPageCaption(ACaption);
end;

function AddGroup(APage: TCustomRibbonPage; AActionManager: TActionManager;
  ACaption, AKeyTip: String; ARows, AGroupAlign: Integer): TRibbonGroup;
begin
  Result := TRibbonGroup.Create(APage.Parent);
  Result.Caption := ACaption;
  Result.Parent := APage;
  Result.ActionManager := AActionManager;
  Result.KeyTip := AKeyTip;
  //array de Integer: 1..3
  if ARows > 3 then
    Result.Rows := 3
  else if ARows < 1 then
    Result.Rows := 1
  else
    Result.Rows := ARows;
  //Tipo de alinhamento: 0 = gaHorizontal, 1 = gaVertical
  case AGroupAlign of
    0: Result.GroupAlign := gaHorizontal;
    1: Result.GroupAlign := gaVertical;
    else Result.GroupAlign := gaHorizontal;
  end;
end;

function LocateGroup(APage: TCustomRibbonPage; ACaption: String): TRibbonGroup;
begin
  Result := TRibbonGroup(APage.FindGroup(ACaption));
end;

procedure AddItem(AActionBegin, AActionEnd: Integer; ARibbonGroup: TRibbonGroup;
  AActionManager: TActionManager; ACommandStyle, AButtonSize,
  AButtonType: Integer);
var
  iAction: Integer;
  iActionBars: Integer;
  i: integer;
begin
  iActionBars := -1;

  for i := 0 to AActionManager.ActionBars.Count - 1 do
  begin
    if AActionManager.ActionBars[i].ActionBar = ARibbonGroup then
    begin
      iActionBars := i;
      Break;
    end;
  end;

  if iActionBars = -1 then
  begin
    AActionManager.ActionBars.Add;
    iActionBars := AActionManager.ActionBars.Count - 1;
  end;

  with AActionManager.ActionBars[iActionBars] do
  begin
    //Atribui o grupo para um ActionBar
    ActionBar := ARibbonGroup;
    for iAction := AActionBegin to AActionEnd do
      with Items.Add do
      begin
        Action := AActionManager.Actions[iAction];
        KeyTip := TAction(AActionManager.Actions[iAction]).Hint;
        //Style: 0 = csButton, 1 = csMenu, 2 = csSeparator, 3 = csText, 4 = csGallery, 5 = csComboBox, 6 = csCheckBox, 7 = csRadioButton, 8 = csControl, 9 = csCustom
        case ACommandStyle of
          0: CommandStyle := csButton;
          1: CommandStyle := csMenu;
          2: CommandStyle := csSeparator;
          3: CommandStyle := csText;
          4: CommandStyle := csGallery;
          5: CommandStyle := csComboBox;
          6: CommandStyle := csCheckBox;
          7: CommandStyle := csRadioButton;
          8: CommandStyle := csControl;
          9: CommandStyle := csCustom;
          else CommandStyle := csButton;
        end;
        //Tamanho do botão: bsSmall, bsLarge
        case AButtonSize of
          0: (CommandProperties as TButtonProperties).ButtonSize := bsSmall;
          1: (CommandProperties as TButtonProperties).ButtonSize := bsLarge;
          else (CommandProperties as TButtonProperties).ButtonSize := bsSmall;
        end;
        //Tipo do botão: 0 = btNone, 1 = btDropDown, 2 = btSplit, 3 = btGallery
        case AButtonType of
          0: (CommandProperties as TButtonProperties).ButtonType := btNone;
          1: (CommandProperties as TButtonProperties).ButtonType := btDropDown;
          2: (CommandProperties as TButtonProperties).ButtonType := btSplit;
          3: (CommandProperties as TButtonProperties).ButtonType := btGallery;
          else (CommandProperties as TButtonProperties).ButtonType := btNone;
        end;
      end;
  end;
end;

procedure AddApplicationMenu(ARibbon: TRibbon; AActionManager: TActionManager);
var
  RibbonApplicationMenuBar: TRibbonApplicationMenuBar;
  ActionBarItem: TActionBarItem;
begin

  //esta com defeito, corrigir
    {
  RibbonApplicationMenuBar := TRibbonApplicationMenuBar.Create(Application);
  RibbonApplicationMenuBar.ActionManager := AActionManager;
//  RibbonApplicationMenuBar.SetRibbon(ARibbon);
  ARibbon.ApplicationMenu.Menu := RibbonApplicationMenuBar;
  ActionBarItem := AddActionBarItem(AActionManager);
  ActionBarItem.ActionBar := RibbonApplicationMenuBar;
  ActionBarItem.ActionBar.RecreateControls;



//  with AActionManager.ActionBars.Add do
//  begin
//    ActionBar := RibbonApplicationMenuBar;
//    ActionBar.RecreateControls;
//  end;

//  RibbonApplicationMenuBar.OptionItems := TOptionItems.Create(Application, TOptionItem); ???

  ARibbon.ApplicationMenu.Show(True);
  }
end;

procedure AddRecentItem(ARibbon: TRibbon; AFileName: String);
begin
  if not AnsiSameText(AFileName, EmptyStr) then
    ARibbon.AddRecentItem(AFileName);
end;

end.
