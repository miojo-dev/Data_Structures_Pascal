Program simple_queue;
uses crt;

var pointer:byte;
var queue:array[1..5] of integer;
var input:integer;

procedure include(queue:array of integer; pointer:integer; full:boolean);
var num:integer;
begin
    if (full = false) then
    begin
        write('number: ');
        readln(num);
        
        queue[pointer] := num;
        pointer := pointer + 1;
        
        ClrScr;
        writeln(num, ' added to the queue');
    end
    else
    begin
        ClrScr;
        writeln('queue full');
    end
end;

procedure remove(queue:array of integer; pointer:integer; empty:boolean);
var i:integer;
begin
	i := 1;
    if (empty = false) then
    begin
        ClrScr;
        writeln(queue[1], ' removed');
        
        while i < 5 do
        begin
            queue[i] := queue[i + 1];
            i := i + 1;
        end;
        
        pointer := pointer - 1;
    end
    else
    begin
        ClrScr;
        writeln('empty queue');
    end
end;

procedure consult(queue:array of integer; empty:boolean);
begin
    if (empty = false) then
    begin
        ClrScr;
        writeln(queue[1]);
    end
    else
    begin
        ClrScr;
        writeln('empty queue');
    end
end;

procedure _write(queue:array of integer; pointer:integer);
var i:integer;
begin
    i := 1;
    
    ClrScr;
    
    while i < pointer do
    begin
        write(queue[i], '|');
        i := i + 1;
    end
end;

function full(queue:array of integer; pointer:integer):boolean;
begin
	if (pointer > length(queue)) then
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
        1: include(queue; pointer; full(queue; pointer));
        2: remove(queue; pointer; empty(pointer));
        3: consult(queue; empty(pointer));
        4: _write(queue; pointer);
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
