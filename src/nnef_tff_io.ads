pragma Ada_95;
pragma Profile (Ravenscar);
pragma Elaboration_Checks (Static);

with Ada.Streams.Stream_IO;
with Interfaces;

package NNEF_TFF_IO is

    use Ada.Streams, Interfaces;

    -- NNEF Tensor File Format
    type IEEE_Float_16 is new Unsigned_16;

    type Unsigned_32_Array is array(Unsigned_32 range <>) of Unsigned_32;

    type TFF_Version_Info is record
        Version_Info_Major: Stream_Element;
        Version_Info_Minor: Stream_Element;
    end record;
    for TFF_Version_Info use record
        Version_Info_Major at 0 range 0 .. 7;
        Version_Info_Minor at 1 range 0 .. 7;
    end record;
    for TFF_Version_Info'Size use 2 * 8;

    type TFF_Item_Type is record
        Vendor_Code: Unsigned_16;
        Item_Type: Unsigned_16;
    end record;
    for TFF_Item_Type use record
        Vendor_Code at 0 range 0 .. 15;
        Item_Type at 2 range 0 .. 15;
    end record;
    for TFF_Item_Type'Size use 4 * 8;

    type TFF_Header_Type is record
        Version_Info: TFF_Version_Info;
        Length_In_Bytes: Unsigned_32;
        Rank: Unsigned_32 range 0..8;
        Extents: Unsigned_32_Array (0..7);
        Number_Of_Bits: Unsigned_32 range 1..64;
        Item_Type_Code: TFF_Item_Type;
        Parameters: Stream_Element_Array (0..31);
        Reserved: Stream_Element_Array(1..128-84);
    end record;
    for TFF_Header_Type use record
        --  Magic at 0 range 0 .. 15;
        Version_Info at 0 range 0 .. 15;
        Length_In_Bytes at 2 range 0 .. 31;
        Rank at 6 range 0 .. 31;
        Extents at 10 range 0 .. 255;
        Number_Of_Bits at 42 range 0 .. 31;
        Item_Type_Code at 46 range 0 .. 31;
        Parameters at 50 range 0 .. 255;
        Reserved at 82 range 0 .. 351;
    end record;
    for TFF_Header_Type'Size use 128 * 8 - 16;

    TFF_Format_Error: exception;
    TFF_Signature_Error: exception;
    TFF_Unknown_Vendor_Error: exception;
    TFF_Item_Type_Error: exception;
    TFF_Bits_Per_Item_Error: exception;
    TFF_Rank_Error: exception;

    procedure Read_TFF_Header (Stream: not null access Root_Stream_Type'Class; Header: out TFF_Header_Type);

    procedure Write_TFF_Header (Header: TFF_Header_Type; Stream: not null access Root_Stream_Type'Class);

    generic
        with procedure Callback(Index: Unsigned_32_Array; Element: Stream_Element_Array);
    procedure Generic_Read_TFF_Data (Stream: not null access Root_Stream_Type'Class; Header: TFF_Header_Type);

    generic
        with procedure Callback(Index: Unsigned_32_Array; Element: out Stream_Element_Array);
    procedure Generic_Write_TFF_Data (Header: TFF_Header_Type; Stream: not null access Root_Stream_Type'Class);

    generic
        type Result_Type is range <>;
    function Generic_To_Integer (Element: Stream_Element_Array; Header: TFF_Header_Type) return Result_Type;

    generic
        type Result_Type is digits <>;
    function Generic_To_Float (Element: Stream_Element_Array; Header: TFF_Header_Type) return Result_Type;

    generic
        type Element_Type is range <>;
    function Generic_From_Integer (Value: Element_Type; Header: TFF_Header_Type) return Stream_Element_Array;

    generic
        type Element_Type is digits <>;
    function Generic_From_Float (Value: Element_Type; Header: TFF_Header_Type) return Stream_Element_Array;

    function IEEE_Float_16_To_32 (Value: IEEE_Float_16) return IEEE_Float_32;

    function IEEE_Float_32_To_16 (Value: IEEE_Float_32) return IEEE_Float_16;

    function To_Boolean(Byte: Stream_Element_Array) return Boolean;
    pragma Inline(To_Boolean);

    function To_Boolean(Byte: Stream_Element_Array; Bit: Natural) return Boolean;
    pragma Inline(To_Boolean);

    function To_Unsigned_8(Byte: Stream_Element_Array) return Unsigned_8;
    pragma Inline(To_Unsigned_8);

    function To_Unsigned_16(Bytes: Stream_Element_Array) return Unsigned_16;
    pragma Inline(To_Unsigned_16);

    function To_Unsigned_32(Bytes: Stream_Element_Array) return Unsigned_32;
    pragma Inline(To_Unsigned_32);

    function To_Unsigned_64(Bytes: Stream_Element_Array) return Unsigned_64;
    pragma Inline(To_Unsigned_64);

    function To_Integer_8(Byte: Stream_Element_Array) return Integer_8;
    pragma Inline(To_Integer_8);

    function To_Integer_16(Bytes: Stream_Element_Array) return Integer_16;
    pragma Inline(To_Integer_16);

    function To_Integer_32(Bytes: Stream_Element_Array) return Integer_32;
    pragma Inline(To_Integer_32);

    function To_Integer_64(Bytes: Stream_Element_Array) return Integer_64;
    pragma Inline(To_Integer_64);

    function To_IEEE_Float_16(Bytes: Stream_Element_Array) return IEEE_Float_16;
    pragma Inline(To_IEEE_Float_16);

    function To_IEEE_Float_32(Bytes: Stream_Element_Array) return IEEE_Float_32;
    pragma Inline(To_IEEE_Float_32);

    function To_IEEE_Float_64(Bytes: Stream_Element_Array) return IEEE_Float_64;
    pragma Inline(To_IEEE_Float_64);

    function To_Stream_Element_Array(Value: IEEE_Float_64) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: IEEE_Float_32) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: IEEE_Float_16) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: Integer_64) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: Integer_32) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: Integer_16) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: Integer_8) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: Unsigned_64) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: Unsigned_32) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: Unsigned_16) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: Unsigned_8) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function To_Stream_Element_Array(Value: Boolean) return Stream_Element_Array;
    pragma Inline(To_Stream_Element_Array);

    function Encode_Linear_Quantization(X, Min, Max: IEEE_Float_32) return Integer_32;
    pragma Inline(Encode_Linear_Quantization);

    function Encode_Linear_Quantization(X, Min, Max: IEEE_Float_32) return Unsigned_32;
    pragma Inline(Encode_Linear_Quantization);

    function Decode_Linear_Quantization(Q: Integer_32; Min, Max: IEEE_Float_32) return IEEE_Float_32;
    pragma Inline(Decode_Linear_Quantization);

    function Decode_Linear_Quantization(Q: Unsigned_32; Min, Max: IEEE_Float_32) return IEEE_Float_32;
    pragma Inline(Decode_Linear_Quantization);

    function Encode_Logarithmic_Quantization(X, Min, Max: IEEE_Float_32) return Integer_32;
    pragma Inline(Encode_Logarithmic_Quantization);

    function Encode_Logarithmic_Quantization(X, Min, Max: IEEE_Float_32) return Unsigned_32;
    pragma Inline(Encode_Logarithmic_Quantization);

    function Decode_Logarithmic_Quantization(Q: Integer_32; Min, Max: IEEE_Float_32) return IEEE_Float_32;
    pragma Inline(Decode_Logarithmic_Quantization);

    function Decode_Logarithmic_Quantization(Q: Unsigned_32; Min, Max: IEEE_Float_32) return IEEE_Float_32;
    pragma Inline(Decode_Logarithmic_Quantization);

end NNEF_TFF_IO;
