pragma Ada_95;
pragma Profile (Ravenscar);

with Ada.Streams.Stream_IO;
with GID;
with NNEF_TFF_IO;
with Interfaces.C;

package body Generic_Utils is

    procedure Load_Image_Content (Path: String; Index: Positive; Tensor: out Real_Tensor_4D) is
        use Ada.Streams.Stream_IO;
        use GID;
        File: File_Type;
        Image: Image_Descriptor;

        dX, dY: Integer := 0;
        Image_Width : Positive;
        Image_Height: Positive;
        type Primary_Color_Range is mod 256;
        mX, mY : Natural;

        procedure Set_X_Y (X, Y: Natural) is
        begin
            mX := 1 + X + dX;
            mY := 1 + Y + dY;
        end Set_X_Y;

        procedure Put_Pixel (Red, Green, Blue: Primary_Color_Range; Alpha: Primary_Color_Range) is
            pragma Warnings (Off, Alpha); -- Alpha is just ignored
        begin
            if mX in Tensor'Range(4) AND then mY in Tensor'Range(3) then
                -- Load image to BGR format
                Tensor (Index, 1, mY, mX) := Real (Blue);
                Tensor (Index, 2, mY, mX) := Real (Green);
                Tensor (Index, 3, mY, mX) := Real (Red);
            end if;
            mX := mX + 1;
        end Put_Pixel;

        procedure Feedback (Percents : Natural) is
        begin
            null;
        end Feedback;

        procedure Load_Image is new Load_Image_Contents (Primary_Color_Range, Set_X_Y, Put_Pixel, Feedback, fast);

        Next_Frame: Duration := 0.0;
    begin
        Open (File, In_File, Path);
        Load_Image_Header (Image, Stream(File).all, try_tga => false);
        Image_Width  := Pixel_Width (Image);
        Image_Height := Pixel_Height (Image);
        if Image_Width > Tensor'Length(4) then
            dX := (Tensor'Length(4) - Image_Width) / 2;
        end if;
        if Image_Height > Tensor'Length(3) then
            dY := (Tensor'Length(3) - Image_Height) / 2;
        end if;
        Load_Image (Image, Next_Frame);
        Close (File);
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Load_Image_Content;

    function Get_Line (File: Ada.Text_IO.File_Type) return String is
        Buffer: String (1..256);
        Last: Natural;
    begin
        Ada.Text_IO.Get_Line(File, Buffer, Last);
        if Last < Buffer'Last then
            return Buffer(1..Last);
        else
            return Buffer & Get_Line(File);
        end if;
    end;

    function Get_Line (Path: String; Index: Natural) return String is
        use Ada.Text_IO;
        File: File_Type;
        I: Natural := 0;
    begin
        Open (File, In_File, Path);
        while NOT End_Of_File(File) loop
            declare
                S: String := Get_Line(File);
            begin
                if I = Index then
                    Close (File);
                    return S;
                end if;
            end;
            I := I + 1;
        end loop;
        Close (File);
        raise Index_Not_Found_Error;
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Get_Line;

    procedure Load_TFF_Data (Path: String; Tensor: out Real_Vector) is
        use IO;
        use Ada.Streams.Stream_IO;
        File: File_Type;
    begin
        Open (File, In_File, Path);
        Read_TFF (File, Tensor);
        Close (File);
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Load_TFF_Data;

    procedure Load_TFF_Data (Path: String; Tensor: out Real_Matrix) is
        use IO;
        use Ada.Streams.Stream_IO;
        File: File_Type;
    begin
        Open (File, In_File, Path);
        Read_TFF (File, Tensor);
        Close (File);
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Load_TFF_Data;

    procedure Load_TFF_Data (Path: String; Tensor: out Real_Tensor_4D) is
        use IO;
        use Ada.Streams.Stream_IO;
        File: File_Type;
    begin
        Open (File, In_File, Path);
        Read_TFF (File, Tensor);
        Close (File);
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Load_TFF_Data;

    procedure Write_TFF_Data (Tensor: Real_Vector; Path: String) is
        use IO;
        use Ada.Streams.Stream_IO;
        File: File_Type;
    begin
        Create (File, Out_File, Path);
        Write_TFF (Tensor, File);
        Close (File);
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Write_TFF_Data;

    procedure Write_TFF_Data (Tensor: Real_Matrix; Path: String) is
        use IO;
        use Ada.Streams.Stream_IO;
        File: File_Type;
    begin
        Create (File, Out_File, Path);
        Write_TFF (Tensor, File);
        Close (File);
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Write_TFF_Data;

    procedure Write_TFF_Data (Tensor: Real_Tensor_4D; Path: String) is
        use IO;
        use Ada.Streams.Stream_IO;
        File: File_Type;
    begin
        Create (File, Out_File, Path);
        Write_TFF (Tensor, File);
        Close (File);
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Write_TFF_Data;

    procedure Put (Tensor: Real_Vector; Path: String) is
        use IO;
        use Ada.Text_IO;
        File: File_Type;
    begin
        Create (File, Out_File, Path);
        Put (File, Tensor);
        Close (File);
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Put;

    procedure Put (Tensor: Real_Matrix; Path: String) is
        use IO;
        use Ada.Text_IO;
        File: File_Type;
    begin
        Create (File, Out_File, Path);
        Put (File, Tensor);
        Close (File);
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Put;

    procedure Put (Tensor: Real_Tensor_4D; Path: String) is
        use IO;
        use Ada.Text_IO;
        File: File_Type;
    begin
        Create (File, Out_File, Path);
        Put (File, Tensor);
        Close (File);
    exception
        when E: others =>
            if Is_Open(File) then
                Close(File);
            end if;
            raise;
    end Put;

end Generic_Utils;