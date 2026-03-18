Program simple_stack;
uses crt;

var pointer := 1:integer;
var stack:array[1..5] of integer;

procedure include(stack:array of integer; pointer:integer; full:boolean);
var num:integer;
begin
    if (full = false) then
    begin
        write('number: ');
        readln(num);
        
        stack[pointer] := num;
        pointer := pointer + 1;
        
        ClrScr;
        writeln(num, ' added to the stack');
    end
    else
    begin
        ClrScr;
        writeln('list full');
    end
end;

procedure remove(stack:array of integer; pointer:integer; empty:boolean);
var i:integer;
begin
	i := 1;
    if (empty = false) then
    begin
        ClrScr;
        writeln(stack[5], ' removed');
        
        while i < 5 do
        begin
            stack[i] := stack[i + 1];
            i := i + 1;
        end;
        
        pointer := pointer - 1;
    end
    else
    begin
        ClrScr;
        writeln('empty stack');
    end
end;

procedure consult(stack:array of integer; pointer:integer; empty:boolean);
begin
    if (empty = false) then
    begin
        ClrScr;
        writeln(stack[pointer - 1]);
    end
    else
    begin
        ClrScr;
        writeln('empty stack');
    end
end;

procedure _write(stack:array of integer; pointer:integer);  
var i:integer;
begin
    ClrScr;
    
    for i := pointer downto 1 do
    begin
        write(stack[i], '|');
        i := i + 1;
    end
end;

function full(stack:array of integer; pointer:integer):boolean;
begin
	if (pointer > length(stack)) then
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

procedure menu();
var input:integer;
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
