Program simple_list;
uses crt;

var pointer:byte;
var list:array[1..5] of string;
var input:string;

function getSortedIndex(input:string; list:array of string; pointer:integer):integer;
var i:integer;
begin
    for i := 1 to pointer do
    begin
        if (list[i] > input) or (i = pointer) then
        begin
            getSortedIndex := i;
        end
    end
end;

procedure include(list:array of string; pointer:integer; full:boolean; index_sorted:integer);
var word:string;
var i:integer;
begin
    if not full then
    begin
        write('string: ');
        readln(word);
        
        for i := 1 to 5 do
        begin
            if list[i] = word then
            begin
                writeln('Element already inserted');
            end
        end
        else
        begin
            if index_sorted <= pointer - 1 then
            begin
                list[index_sorted] := word;
                pointer := pointer + 1;
            end
            else
            begin
                for i := index_sorted to pointer do
                begin
                    list[i + 1] := list[i];
                end
                
                list[index_sorted] := word;
            end
            
            ClrScr;
            writeln(word, ' added to the list');
        end
    end
    else
    begin
        ClrScr;
        writeln('list full');
    end
end;

procedure remove(input:string; list:array of string; pointer:integer; empty:boolean);
var i:integer;
begin
    if empty = false then
    begin
        ClrScr;
        writeln('Item: ', input, ', removed');
        for i := 1 to pointer do
        begin
            if (list[i] = input) then
            begin
                for i to pointer - 1 do
                begin
                    list[i] := list[i + 1];
                end
            end
        end
    end
    else
    begin
        ClrScr;
        writeln('empty list');
    end
end;

procedure consult(input:string; list:array of string; pointer:integer; empty:boolean);
var i:integer;
begin
    if (empty = false) then
    begin
        for i := 1 to pointer - 1 do
        begin
            if (list[i] = input) then
            begin
                writeln('This item: ', input, ', can be found on index: ', i);
            end
        end
    end
    else
    begin
        ClrScr;
        writeln('empty list');
    end
end;

procedure _write(list:array of string; pointer:integer);
var i:integer;
begin
    ClrScr;
    
    for i := 1 to pointer - 1 do
    begin
        write(list[i], '|');
    end
end;

function full(list:array of string; pointer:integer):boolean;
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
        1: include(list; pointer; full(list; pointer));
        2: remove(list; pointer; empty(pointer));
        3: consult(list; empty(pointer));
        4: _write(list; pointer);
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
