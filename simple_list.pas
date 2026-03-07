Program simple_list;
uses crt;

var pointer:byte;
var list:array[1..5] of integer;
var input:integer;

procedure include(full:boolean);
var num:integer;
begin
    if (full = false) then
    begin
        write('number: ');
        readln(num);
        
        list[pointer] := num;
        pointer := pointer + 1;
        
        ClrScr;
        writeln(num, ' added to the list');
    end
    else
    begin
        ClrScr;
        writeln('list full');
    end
end;

procedure remove(empty:boolean);
var i:integer;
begin
	i := 1;
    if (empty = false) then
    begin
        ClrScr;
        writeln(list[1], ' removed');
        
        while i < 5 do
        begin
            list[i] := list[i + 1];
            i := i + 1;
        end;
        
        pointer := pointer - 1;
    end
    else
    begin
        ClrScr;
        writeln('empty list');
    end
end;

procedure consult(empty:boolean);
begin
    if (empty = false) then
    begin
        ClrScr;
        writeln(list[1]);
    end
    else
    begin
        ClrScr;
        writeln('empty list');
    end
end;

procedure _write();  
var i:integer;
begin
    i := 1;
    
    ClrScr;
    
    while i < pointer do
    begin
        write(list[i], '|');
        i := i + 1;
    end
end;

function full():boolean;
begin
	if (pointer > length(list)) then
	begin
		full := true;
	end
	else
	begin
		full := false;
	end
end;

function empty():boolean;
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

procedure menu();
Begin
    writeln;
    writeln('*====================*');
    writeln('*  Choose an action  *');
    writeln('*1 - include         *');
    writeln('*2 - remove          *');
    writeln('*3 - consult         *');
    writeln('*4 - write           *');
    writeln('*0 - quit            *');
    writeln('*====================*');
    readln(input);
    
    case input of
        1: include(full());
        2: remove(empty());
        3: consult(empty());
        4: _write();
    end;
    
    if (input = 0) then
    Begin
        writeln('exiting program...')
    End;
    else
    Begin
        menu();
    End;
End;

Begin
    pointer := 1;
    
    menu();
End.
