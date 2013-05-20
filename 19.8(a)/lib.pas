unit lib;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  Tkey=integer;

  PNode=^TNode;
  TNode=record
    key:        Tkey;
    left,right: PNode;
  end;

  Ttree=class
  private
    Head: PNode;
    procedure Insert0(var t: PNode; i: TKey);
    procedure Search0(x: Tkey; var Tree,p: PNode);
    procedure PrintTree0 (Tree: PNode);
  public
    constructor Create;
    destructor Destroy;
    procedure Clear;
    procedure PreOrder(Tree: PNode; var s:integer);
    procedure Search(x: Tkey; var p: pnode);
    procedure Insert (i: TKey);
    procedure PrintTree;
  end;

var
  Tree: TTree;


implementation

constructor TTree.Create;
begin
  inherited Create;
end;

destructor TTree.Destroy;
begin
  inherited Destroy;
end;

procedure TTree.Clear;
begin
  Head := nil;
end;

procedure TTree.Insert0(var t: PNode; i: TKey);
begin
    if t = nil then
  begin
    New(t);
    with t^ do
    begin
      key:=i;
      left:=nil;
      right:=nil;
    end;
  end
  else
    if i <= t.key then
      Insert0(t.left,i)
    else
      Insert0(t.right,i);
end;

procedure TTree.Search0(x: Tkey; var Tree,p: PNode);
begin
  p:=nil;
  if tree<>nil then
  begin
    if x < Tree.key then
        Search0(x,Tree.left,p)
    else
      if x > Tree.key then
        Search0(x,Tree.right,p)
      else
        p:=Tree;
  end;
end;

procedure TTree.PreOrder (Tree: PNode; var  s: integer);
begin
  if Tree <> Nil then
  begin
    s:=s+tree.key;
    PreOrder(Tree^.left,s);
    PreOrder(Tree^.right,s);
  end;
end;

procedure TTree.PrintTree0(Tree: PNode);
var
  f: textfile;
  s: string;
  i: integer;

  procedure PreOrder1(Tree: PNode);
  begin
  if Tree <> Nil then
    begin
      PreOrder1(Tree^.left );
      PreOrder1(Tree^.right);
      if (Tree.left<>nil) then
        writeln(f,IntToStr(Tree.key),'->',IntToStr(Tree.left^.key));
      if (Tree.right<>nil) then
        writeln(f,Tree.key,'->',IntToStr(Tree.right^.key));
    end;
  end;

begin
  AssignFile(f,'Tree1.Txt');
  ReWrite (f);
  writeln(f,'digraph G {');
  PreOrder1(Tree);
  writeln(f,'}');
  closefile(f);
end;

procedure TTree.Search(x: Tkey; var p: PNode);
begin
  search0(x,head,p);
end;

procedure TTree.Insert(i: TKey);
begin
  Insert0(Head,i);
end;

procedure Ttree.PrintTree;
begin
  PrintTree0(Head);
end;

end.


