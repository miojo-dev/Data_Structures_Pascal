Program Pzim ;

var pointer:byte;
var list:array[1..5] of integer;

procedure include(list:array[1..5] of integer, is_full:boolean, num:integer, pointer:integer);
begin
  if (is_full = false) then
  begin
    list[pointer] := num;
    pointer := pointer + 1;
  end
  else
  begin
    writeln('list full');
  end
end;

procedure remove(list:array[1..5] of integer, is_empty:boolean, pointer:integer);
var i:integer;
begin
	i := 1;
  if (is_empty = false) then
  begin
    while i < 5 do
    begin
      list[i] := list[i + 1];
      i := i + 1;
    end;
    pointer := pointer - 1;
  end
  else
  begin
    writeln('empty list');
  end
end;

function consult(list:array[1..5] of integer, is_empty:boolean):integer;
begin
  if (is_empty = false) then
  begin
    consult := list[1];
  end
  else
  begin
    writeln('empty list');
  end
end;

procedure _write(list:array[1..5] of integer);  
var i:integer;
begin
  i := 1;
  writeln(' ');
  while i <= 5 do
  begin
    write(list[i], '|');
    i := i + 1;
  end
end;

function full(list:array[1..5] of integer, pointer:integer):boolean;
begin
	if (pointer > legth(list)) then
	begin
		full := true;
	end
	else
	begin
		full := false;
	end
end;

function empty(pointer:integer):boolean;
begin
	if (pointer <= 1) then
	begin
		empty := true;
	end
	else
	begin
	 empty := false;
	end
end;

Begin
  
End.
